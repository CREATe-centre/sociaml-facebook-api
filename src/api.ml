module Endpoints = Sociaml_facebook_api_endpoints

let filter_p = Util.Params.filter_optional_params

let filter_p_since_until_limit since until limit =
  filter_p [
      ("since", since, string_of_int);
      ("until", until, string_of_int);
      ("limit", limit, string_of_int)]

module S (Req : Request.S) = struct

  module R = Core_kernel.Result

  open Lwt
  open Endpoints.Common
  open Endpoints.User

  type ('a, 'b) paged = {
    response : 'a;
    next : (unit -> (('a, 'b) paged, 'b) Request.response) option;
    previous : (unit -> (('a, 'b) paged, 'b) Request.response) option;
  }


  module Paged (PR : PagedResponse) = struct

    open PR

    let rec parse_paged_response req converter = function
      | R.Ok (r : PR.t) ->
        let u_to_c = (function
          | None -> None
          | Some uri -> Some (fun () ->
            Req.do_request_by_uri req uri converter >>=
              (parse_paged_response req converter)))
        in
        R.Ok (match r.paging with
          | Some paging -> {
              response = r;
              next = u_to_c paging.next;
              previous = u_to_c paging.previous;
            }
          | None -> {
              response = r;
              next = None;
              previous = None;
            }) |> return
        | R.Error e -> R.Error e |> return

  end


  module User = struct

    let read ?user_id:(user_id="me") req =
      let path = Printf.sprintf "/%s" user_id in
      Req.do_request req path Endpoints.User.t_of_json


    module Home = struct

      let read ?user_id:(user_id="me") ?since ?until ?limit req =
        let params = filter_p_since_until_limit since until limit in
        let path = Printf.sprintf "/%s/home" user_id in
        let module P = Paged(Home.ReadResponse) in
        Req.do_request ~parameters:params req path Home.ReadResponse.t_of_json
        >>=
        (P.parse_paged_response req Home.ReadResponse.t_of_json)

    end


    module Feed = struct

      let read ?user_id:(user_id="me") ?since ?until ?limit req =
        let params = filter_p_since_until_limit since until limit in
        let module P = Paged(Feed.ReadResponse) in
        let path = Printf.sprintf "/%s/feed" user_id in
        Req.do_request ~parameters:params req path Feed.ReadResponse.t_of_json
        >>=
        (P.parse_paged_response req Feed.ReadResponse.t_of_json)

      let publish ?user_id:(user_id="me") data req =
        let path = Printf.sprintf "/%s/feed" user_id in
        Req.do_request
          ~parameters:[("message", data.Feed.PublishRequest.message)] req path
          ~method':`POST Feed.PublishResponse.t_of_json

    end


    module Posts = struct

      let read ?user_id:(user_id="me") ?since ?until ?limit req =
        let params = filter_p_since_until_limit since until limit in
        let module P = Paged(Posts.ReadResponse) in
        let path = Printf.sprintf "/%s/posts" user_id in
        Req.do_request
          ~parameters:params req path Posts.ReadResponse.t_of_json >>=
        (P.parse_paged_response req Posts.ReadResponse.t_of_json)

    end


    module Friends = struct

      let read ?user_id:(user_id="me") ?limit req =
        let params = filter_p [("limit", limit, string_of_int)] in
        let path = Printf.sprintf "/%s/friends" user_id in
        let module P = Paged(Friends.ReadResponse) in
        Req.do_request
          ~parameters:params req path Friends.ReadResponse.t_of_json >>=
        (P.parse_paged_response req Friends.ReadResponse.t_of_json)

    end


  end


end

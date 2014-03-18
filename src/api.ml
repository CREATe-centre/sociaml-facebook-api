module S (Req : Request.S) = struct
  
  module R = Core.Result
  
  open Lwt
  
  type ('a, 'b) paged = {
    response : 'a;
    next : (unit -> (('a, 'b) paged, 'b) Request.response) option;
    previous : (unit -> (('a, 'b) paged, 'b) Request.response) option;
  }
  
  
  module Paged (PR : Types.PagedResponse) = struct
  
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
      
  
  let get_home_stream ?user_id:(user_id="me") ?since ?until ?limit req =
    let params = [ (since, "since"); (until, "until"); (limit, "limit"); ]
      |> List.fold_left (fun acc (arg, name) ->
        List.append 
        (match arg with
        | Some v -> [(name, string_of_int v)]
        | None -> []) acc) [] 
    in
    let path = Printf.sprintf "/%s/home" user_id in
    let module P = Paged(Types.Home_stream) in 
    Req.do_request ~parameters:params req path Types.Home_stream.t_of_json >>= 
      (P.parse_paged_response req Types.Home_stream.t_of_json) 
      
      
  (*let publish_message ?user_id:(user_id="me") t text =
  Printf.sprintf "/%s/feed" user_id 
  |> post_expect_200 t [("message", text)] >>= function
    | Ok body -> Ok (Types.publish_response_of_string body) |> Lwt.return
    | Error No_response -> Error No_response |> Lwt.return
    | Error (Unexpected_response (a, b, c)) -> Error (Unexpected_response (a, b, c)) |> Lwt.return*)
  
end

module S (Req : Request.S) = struct
  
  module R = Core.Result
    
    open Lwt
    open Types.Common
    open Types.User
      
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
      
      module Home = struct
        
        let read ?user_id:(user_id="me") ?since ?until ?limit req =
          let params = [ (since, "since"); (until, "until"); (limit, "limit"); ]
            |> List.fold_left (fun acc (arg, name) ->
              List.append 
                (match arg with
                  | Some v -> [(name, string_of_int v)]
                  | None -> []) acc) [] 
          in
          let path = Printf.sprintf "/%s/home" user_id in
          let module P = Paged(Home.ReadResponse) in 
          Req.do_request ~parameters:params req path Home.ReadResponse.t_of_json >>= 
            (P.parse_paged_response req Home.ReadResponse.t_of_json)
            
      end
      
      
      module Feed = struct
        
        let publish ?user_id:(user_id="me") data req =
          let path = Printf.sprintf "/%s/feed" user_id in
          Req.do_request ~parameters:[("message", data.Feed.PublishRequest.message)] req path 
            ~method':`POST Feed.PublishResponse.t_of_json
            
      end
      
    end      
    
end

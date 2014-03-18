module S (Req : Request.S) : sig
  
  type ('a, 'b) paged = {
    response : 'a;
    next : (unit -> (('a, 'b) paged, 'b) Request.response) option;
    previous : (unit -> (('a, 'b) paged, 'b) Request.response) option;
  }
  
  val get_home_stream : 
    ?user_id:string  
    -> ?since : int
    -> ?until : int
    -> ?limit : int
    -> Req.t
    -> ((Types.Home_stream.t, 
      [> | Tiny_json.Json.t Request.Error.t ] as 'a) paged, 'a) Request.response
      
  (*val publish_message : ?user_id:string -> t -> string -> Types.publish_response response Lwt.t*)
  
end

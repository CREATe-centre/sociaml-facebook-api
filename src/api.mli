module Endpoint : sig
  type t
  val to_uri : t -> Uri.t
  val of_uri : Uri.t -> t
end

type t

type error = 
  | No_response
  | Unexpected_response of int * int * string

type 'a response =
  | Ok of 'a
  | Error of error

val create : Endpoint.t -> Auth.Token.t -> t

val error_to_string : error -> string

val get_home_stream : 
  ?user_id:string -> ?since:int -> t -> Types.response response Lwt.t
  
val publish_message : ?user_id:string -> t -> string -> Types.publish_response response Lwt.t
  
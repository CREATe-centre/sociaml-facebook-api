module Client_ID : sig
  type t
  val to_string : t -> string
  val of_string : string -> t
end


module Token : sig
  type t
  val to_string : t -> string
  val of_string : string -> t
end


module Permission : sig
  type t =
    | Read_stream 
    | Publish_actions
end


val authorize_uri :
    ?redirect_uri:Uri.t 
    -> ?state:string 
    -> ?permissions:Permission.t list
    -> Client_ID.t 
    -> Uri.t
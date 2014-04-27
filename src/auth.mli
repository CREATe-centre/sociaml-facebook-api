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


val authorize_uri :
    ?redirect_uri:Uri.t 
    -> ?state:string 
    -> ?permissions:string list
    -> Client_ID.t 
    -> Uri.t
    
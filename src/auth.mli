module Client_id : sig
  type t
  val to_string : t -> string
  val of_string : string -> t
end


module Client_secret : sig
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
    -> ?response_type:string
    -> Client_id.t 
    -> Uri.t
    
val access_token_uri :
    ?redirect_uri:Uri.t
    -> Client_id.t
    -> Client_secret.t
    -> string
    -> Uri.t
    
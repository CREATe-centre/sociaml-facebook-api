module Client_ID : sig
  type t
  val to_string : t -> string
  val of_string : string -> t
end


module Client_Secret : sig
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
    -> Client_ID.t 
    -> Uri.t
    
val access_token_uri :
    ?redirect_uri:Uri.t
    -> Client_ID.t
    -> Client_Secret.t
    -> string
    -> Uri.t
    
module List : sig
  val implode : string -> string list -> string
end


module Params : sig

  val filter_optional_params :
    (string * 'a option * ('a -> string)) list -> (string * string) list

end

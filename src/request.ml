module Error = struct
  type expected = int
  type actual = int
  type reason = string
  type 'a t = [
    | `Unexpected_response of expected * actual * reason
    | `Exception of exn
    | `Conversion_error of 'a Meta_conv.Error.t
    | `Generic_error of string
  ]
end


type ('a, 'b) response = ('a, 'b) Core_kernel.Result.t Lwt.t

type 'a decoder =
  ?trace:Tiny_json.Json.t Meta_conv.Error.trace
  -> Tiny_json.Json.t ->
  ('a, Tiny_json.Json.t Meta_conv.Error.t) Meta_conv.Result.t


module type S = sig

  type t

  val create : Auth.Token.t -> t

  val do_request_by_uri :
    t
    -> Uri.t
    -> ?expect : int
    -> ?method' : [ | `POST | `GET ]
    -> 'a decoder
    -> ('a, [> | Tiny_json.Json.t Error.t ]) response

  val do_request :
    ?parameters : (string * string) list
    -> t
    -> string
    -> ?expect : int
    -> ?method' : [ | `POST | `GET ]
    -> 'a decoder
    -> ('a, [> | Tiny_json.Json.t Error.t ]) response

end

open Meta_conv.Open
open Json_conv
open Tiny_json

exception Conversion_exception of Json_conv.target Meta_conv.Error.t

exception Not_implemented of string

let cal_format_iso8601 = "%Y-%m-%dT%H:%M:%S%z" 

let x_of_json converter ?trace j =
  let err type' = 
    let t = match trace with | Some t -> t | None -> [] in
    let msg = Printf.sprintf "Expected string, found %s" type' in
    `Error (Meta_conv.Error.Primitive_decoding_failure msg, j, t)
  in
  match j with 
  | Json.String s -> `Ok (converter s)
  | Json.Number _ -> err "number"
  | Json.Array _ -> err "array"
  | Json.Bool _ -> err "bool"
  | Json.Null -> err "null"
  | Json.Object o -> err "object"

type calendar = CalendarLib.Calendar.t

let json_of_calendar _ = raise (Not_implemented "Types.json_of_calendar")

let calendar_of_json = 
  x_of_json (CalendarLib.Printer.Calendar.from_fstring cal_format_iso8601)

type uri = Uri.t

let json_of_uri _ = raise (Not_implemented "Types.json_of_uri")

let uri_of_json = x_of_json Uri.of_string


module type PagedResponse = sig
  
  type data
  
  type page_navigation = {
    next : uri option;
    previous : uri option
  } 
  
  type t = { 
    data : data list; 
    paging : page_navigation option; 
  }
  
  val t_of_json : (t, Tiny_json.Json.t) Meta_conv.Types.Decoder.t
  
end


module User = struct
  type t (: Ignore_unknown_fields :) = {
    id : string;
    name : string;
    category : string mc_option;
  } with conv(json)
end


module Post = struct
  type t (: Ignore_unknown_fields :) = {
    created_time : calendar;
    from : User.t;
    id : string;
    message : string mc_option;
    updated_time : calendar;
  } with conv(json)
end


module Home_stream 
  : PagedResponse with type data = Post.t 
  = struct
  
  type data = Post.t with conv(json)
    
  type page_navigation = {
    next : uri mc_option;
    previous : uri mc_option;
  } with conv(json)
  
  type t = { 
    data : data list; 
    paging : page_navigation mc_option;
  } with conv(json)
  
end

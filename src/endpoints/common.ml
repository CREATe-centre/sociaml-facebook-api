open Meta_conv.Open
open Json_conv
open Tiny_json

let cal_format_iso8601 = "%Y-%m-%dT%H:%M:%S%z" 

let cal_format_us_date = "%m/%d/%Y"
 
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

type 'a decoder = ('a, Tiny_json.Json.t) Meta_conv.Types.Decoder.t

type 'a encoder = ('a, Tiny_json.Json.t) Meta_conv.Types.Encoder.t

type calendar_iso8601 = CalendarLib.Calendar.t

let calendar_iso8601_of_json = 
  x_of_json (CalendarLib.Printer.Calendar.from_fstring cal_format_iso8601)
  
let json_of_calendar_iso8601 c = 
  Json.String(CalendarLib.Printer.Calendar.sprint cal_format_iso8601 c)
  
type calendar_us_date = CalendarLib.Calendar.t

let calendar_us_date_of_json = 
  x_of_json (CalendarLib.Printer.Calendar.from_fstring cal_format_us_date)
  
let json_of_calendar_us_date c = 
  Json.String(CalendarLib.Printer.Calendar.sprint cal_format_us_date c)

type uri = Uri.t

let uri_of_json = x_of_json Uri.of_string

let json_of_uri s = Json.String(Uri.to_string s)

type csv = Csv.t

let csv_of_json = x_of_json (fun s -> s |> Csv.of_string |> Csv.input_all)
    
let json_of_csv csv = 
  let buf = Buffer.create 0 in
  let chan = 
    object
        method output s ofs len = 
          Buffer.add_substring buf s ofs len; len
        method close_out () = ()
    end |> Csv.to_out_obj in
  Csv.output_all chan csv;
  Json.String(Buffer.contents buf)
        

module NumberRange = struct
  type t = {
    min            : int;
    max            : int;
  } with conv(of_json)
end


module type PagedResponse = sig
  
  type data
  
  type cursors = {
		after : string;
		before : string;
  }
  
  type page_navigation = {
    next : uri option;
    previous : uri option;
		cursors : cursors option;
  } 
  
  type t = { 
    data : data list; 
    paging : page_navigation option; 
  }
  
  val t_of_json : t decoder
  
  val json_of_t : t encoder
  
end
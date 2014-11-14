open Meta_conv.Open
open Json_conv
open Tiny_json

let cal_format_iso8601 = "%Y-%m-%dT%H:%M:%S%z" 

let cal_format_us_date = "%m/%d/%Y"

exception Meta_conv_error of Json.t Meta_conv.Error.t


module X_of_json_string = struct

  let result converter ?trace j =
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
  
  let exn converter ?trace j = 
    match result converter ?trace j with
    | `Ok result -> result
    | `Error e -> raise (Meta_conv_error e)  
  
end
 

type calendar_iso8601 = CalendarLib.Calendar.t

let calendar_iso8601_of_json = 
  X_of_json_string.result (CalendarLib.Printer.Calendar.from_fstring cal_format_iso8601)
  
let calendar_iso8601_of_json_exn = 
  X_of_json_string.exn (CalendarLib.Printer.Calendar.from_fstring cal_format_iso8601)
  
let json_of_calendar_iso8601 c = 
  Json.String(CalendarLib.Printer.Calendar.sprint cal_format_iso8601 c)
  
type calendar_us_date = CalendarLib.Calendar.t

let calendar_us_date_of_json = 
  X_of_json_string.result (CalendarLib.Printer.Calendar.from_fstring cal_format_us_date)
  
let calendar_us_date_of_json_exn = 
  X_of_json_string.exn (CalendarLib.Printer.Calendar.from_fstring cal_format_us_date)
  
let json_of_calendar_us_date c = 
  Json.String(CalendarLib.Printer.Calendar.sprint cal_format_us_date c)

type uri = Uri.t

let uri_of_json = X_of_json_string.result Uri.of_string

let uri_of_json_exn = X_of_json_string.exn Uri.of_string

let json_of_uri s = Json.String(Uri.to_string s)

type csv = Csv.t

let csv_of = (fun s -> s |> Csv.of_string |> Csv.input_all)

let csv_of_json = X_of_json_string.result csv_of

let csv_of_json_exn = X_of_json_string.exn csv_of  
    
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
  } with conv(json)
end


module type PagedResponse = sig
  
  type data with conv(json)
  
  type cursors = {
		after : string;
		before : string;
  } with conv(json)
  
  type page_navigation = {
    next : uri mc_option;
    previous : uri mc_option;
		cursors : cursors mc_option;
  } with conv(json)
  
  type t = { 
    data : data list; 
    paging : page_navigation mc_option; 
  } with conv(json)
  
end

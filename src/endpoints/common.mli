exception Meta_conv_error of Tiny_json.Json.t Meta_conv.Error.t

type id = string [@@deriving conv{json}]

type calendar_iso8601 = CalendarLib.Calendar.t [@@deriving conv{json}]

type calendar_us_date = CalendarLib.Calendar.t [@@deriving conv{json}]
  
type uri = Uri.t [@@deriving conv{json}]

type csv = Csv.t [@@deriving conv{json}]

module NumberRange : sig
  type t = {
    min            : int;
    max            : int;
  } [@@deriving conv{json}]
end


module type PagedResponse = sig
  
  type data [@@deriving conv{json}]
	
	type cursors = {
		after          : string;
		before         : string;
  } [@@deriving conv{json}]
  
  type page_navigation = {
    next           : uri option;
    previous       : uri option;
		cursors        : cursors option;
  } [@@deriving conv{json}]
  
  type t = { 
    data           : data list; 
    paging         : page_navigation option; 
  } [@@deriving conv{json}]
  
end

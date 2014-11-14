open Meta_conv.Open
open Json_conv
open Tiny_json

exception Meta_conv_error of Json.t Meta_conv.Error.t

type calendar_iso8601 = CalendarLib.Calendar.t with conv(json)

type calendar_us_date = CalendarLib.Calendar.t with conv(json)
  
type uri = Uri.t with conv(json)

type csv = Csv.t with conv(json)


module NumberRange : sig
  type t = {
    min            : int;
    max            : int;
  } with conv(json)
end


module type PagedResponse = sig
  
  type data with conv(json)
	
	type cursors = {
		after          : string;
		before         : string;
  } with conv(json)
  
  type page_navigation = {
    next           : uri option;
    previous       : uri option;
		cursors        : cursors option;
  } with conv(json)
  
  type t = { 
    data           : data list; 
    paging         : page_navigation option; 
  } with conv(json)
  
end

type 'a decoder = ('a, Tiny_json.Json.t) Meta_conv.Types.Decoder.t

type calendar = CalendarLib.Calendar.t

val calendar_of_json : calendar decoder
  
type uri = Uri.t

val uri_of_json : uri decoder


module type PagedResponse = sig
  
  type data
	
	type cursors = {
		after          : string;
		before         : string;
  }
  
  type page_navigation = {
    next           : uri option;
    previous       : uri option;
		cursors        : cursors option;
  } 
  
  type t = { 
    data           : data list; 
    paging         : page_navigation option; 
  }
  
  val t_of_json    : t decoder
  
end
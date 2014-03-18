type calendar = CalendarLib.Calendar.t
  
type uri = Uri.t


module type PagedResponse = sig
  
  type data
  
  type page_navigation = {
    next           : uri option;
    previous       : uri option;
  } 
  
  type t = { 
    data           : data list; 
    paging         : page_navigation option; 
  }
  
  val t_of_json : (t, Tiny_json.Json.t) Meta_conv.Types.Decoder.t
  
end


module User : sig
  type t = {
    id             : string;
    name           : string;
    category       : string option;
  }
end


module Post : sig
  type t = {
    (*actions        : action list option;
    application    : application option;
    caption        : string option;
    comments       : comments option;*)
    created_time   : calendar;
    (*description    : string option;*)
    from           : User.t;
    (*icon           : uri option;*)
    id             : string;
    (*insights       : insight list option;
    is_hidden      : bool option;
    likes          : like list option;
    link           : uri option;*)
    message        : string option;
    (*message_tags   : message_tags option;
    name           : string option;
    object_id      : string option;
    picture        : uri option;
    place          : place option;
    privacy        : privacy;
    properties     : property list option;
    shares         : shares option;
    source         : uri option;
    status_type    : status_type option;
    story          : string option;
    story_tags     : story_tags option;
    to'            : to' option;
    type'          : type';*)
    updated_time   : calendar;
    (*with_tags      : with_tags option;*)
  }
end


module Home_stream : PagedResponse with type data = Post.t

type id = Int64.t

type uri = Uri.t

type calendar = CalendarLib.Calendar.t

type status_type = 
  | Mobile_status_update
  | Created_note
  | Added_photos
  | Added_video
  | Shared_story
  | Created_group
  | Created_event
  | Wall_post
  | App_created_story
  | Published_story
  | Tagged_in_photo
  | Approved_friend
  | Unknown of string

type type' = 
  | Status
  | Link
  | Photo
  | Video
  | Unknown of string

val read_id : Yojson.Safe.lexer_state -> Lexing.lexbuf -> id

val write_id : Bi_outbuf.t -> id -> unit 

val read_uri : Yojson.Safe.lexer_state -> Lexing.lexbuf -> uri

val write_uri : Bi_outbuf.t -> uri -> unit 

val read_calendar : Yojson.Safe.lexer_state -> Lexing.lexbuf -> calendar

val write_calendar : Bi_outbuf.t -> calendar -> unit

val read_status_type : Yojson.Safe.lexer_state -> Lexing.lexbuf -> status_type

val write_status_type : Bi_outbuf.t -> status_type -> unit

val read_type' : Yojson.Safe.lexer_state -> Lexing.lexbuf -> type'

val write_type' : Bi_outbuf.t -> type' -> unit
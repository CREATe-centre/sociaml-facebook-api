module Calf = CalendarLib.Printer.Calendar
module Js = Yojson.Safe

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
  | Swf
  | Unknown of string

let read_id = Js.read_int64

let write_id buf id = Int64.to_string id |> Js.write_intlit buf 

let read_uri state buf = Js.read_string state buf |> Uri.of_string

let write_uri buf u = Uri.to_string u |> Js.write_string buf 
  
let cal_format_iso8601 = "%Y-%m-%dT%H:%M:%S%z" 
  
let read_calendar state buf = 
  Js.read_string state buf |> Calf.from_fstring cal_format_iso8601
  
let write_calendar buf c =
  Calf.sprint cal_format_iso8601 c |> Js.write_string buf
      
let read_status_type state buf =
  match Js.read_string state buf with
  | "mobile_status_update" -> Mobile_status_update
  | "created_note" -> Created_note
  | "added_photos" -> Added_photos
  | "added_video" -> Added_video
  | "shared_story" -> Shared_story
  | "created_group" -> Created_group
  | "created_event" -> Created_event
  | "wall_post" -> Wall_post
  | "app_created_story" -> App_created_story
  | "published_story" -> Published_story
  | "tagged_in_photo" -> Tagged_in_photo
  | "approved_friend" -> Approved_friend
  | s -> LOG "Unknown status type: %s" s LEVEL DEBUG; Unknown s

let write_status_type buf st =
  (match st with 
  | Mobile_status_update -> "mobile_status_update"
  | Created_note -> "created_note"
  | Added_photos -> "added_photos"
  | Added_video -> "added_video"
  | Shared_story -> "shared_story"
  | Created_group -> "created_group"
  | Created_event -> "created_event"
  | Wall_post -> "wall_post"
  | App_created_story -> "app_created_story"
  | Published_story -> "published_story"
  | Tagged_in_photo -> "tagged_in_photo"
  | Approved_friend -> "approved_friend"
  | Unknown u -> u) |> Js.write_string buf

let read_type' state buf =
  match Js.read_string state buf with
  | "status" -> Status
  | "link" -> Link
  | "photo" -> Photo
  | "video" -> Video
  | "swf" -> Swf 
  | s -> LOG "Unknown post type: %s" s LEVEL DEBUG; Unknown s

let write_type' buf t = 
  (match t with
  | Status -> "status"
  | Link -> "link"
  | Photo -> "photo"
  | Video -> "video"
  | Swf -> "swf"
  | Unknown u -> u) |> Js.write_string buf
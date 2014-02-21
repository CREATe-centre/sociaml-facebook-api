(* Auto-generated from "types.atd" *)


type id = Types_ext.id

type uri = Types_ext.uri

type calendar = Types_ext.calendar

type status_type = Types_ext.status_type

type type' = Types_ext.type'

type message_tags = Yojson.Safe.json

type story_tags = Yojson.Safe.json

type action = { name: string; link: uri }

type application = { name: string; namespace: string option; id: id }

type category = { id: id; name: string }

type user = {
  name: string;
  id: id;
  category: string option;
  category_list: category list option
}

type tag = {
  id: id;
  name: string;
  type': string option;
  offset: int option;
  length: int option
}

type privacy = { value: string }

type property = { name: string; text: string; href: uri option }

type shares = { count: int }

type location = {
  street: string;
  city: string option;
  state: string option;
  country: string option;
  zip: string;
  latitude: float;
  longitude: float
}

type place = { id: id; name: string; location: location }

type to' = { data: user list }

type cursors = { after: string option; before: string option }

type paging = {
  cursors: cursors option;
  next: uri option;
  previous: uri option
}

type likes = { data: user list; paging: paging }

type comment = {
  id: string;
  from: user;
  message: string;
  can_remove: bool;
  created_time: calendar;
  like_count: int;
  user_likes: bool;
  message_tags: message_tags option
}

type comments = { data: comment list; paging: paging }

type with_tags = { data: tag list }

type post = {
  id: string;
  actions: action list option;
  application: application option;
  caption: string option;
  comments: comments option;
  created_time: calendar;
  description: string option;
  from: user;
  icon: uri option;
  is_hidden: bool option;
  likes: likes option;
  link: uri option;
  message: string option;
  message_tags: message_tags option;
  name: string option;
  object_id: id option;
  picture: uri option;
  place: place option;
  privacy: privacy;
  properties: property list option;
  shares: shares option;
  source: uri option;
  status_type: status_type option;
  story: string option;
  story_tags: story_tags option;
  to': to' option;
  type': type';
  updated_time: calendar;
  with_tags: with_tags option
}

type response = { data: post list; paging: paging option }

val write_id :
  Bi_outbuf.t -> id -> unit
  (** Output a JSON value of type {!id}. *)

val string_of_id :
  ?len:int -> id -> string
  (** Serialize a value of type {!id}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_id :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> id
  (** Input JSON data of type {!id}. *)

val id_of_string :
  string -> id
  (** Deserialize JSON data of type {!id}. *)


val write_uri :
  Bi_outbuf.t -> uri -> unit
  (** Output a JSON value of type {!uri}. *)

val string_of_uri :
  ?len:int -> uri -> string
  (** Serialize a value of type {!uri}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_uri :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> uri
  (** Input JSON data of type {!uri}. *)

val uri_of_string :
  string -> uri
  (** Deserialize JSON data of type {!uri}. *)


val write_calendar :
  Bi_outbuf.t -> calendar -> unit
  (** Output a JSON value of type {!calendar}. *)

val string_of_calendar :
  ?len:int -> calendar -> string
  (** Serialize a value of type {!calendar}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_calendar :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> calendar
  (** Input JSON data of type {!calendar}. *)

val calendar_of_string :
  string -> calendar
  (** Deserialize JSON data of type {!calendar}. *)


val write_status_type :
  Bi_outbuf.t -> status_type -> unit
  (** Output a JSON value of type {!status_type}. *)

val string_of_status_type :
  ?len:int -> status_type -> string
  (** Serialize a value of type {!status_type}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_status_type :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> status_type
  (** Input JSON data of type {!status_type}. *)

val status_type_of_string :
  string -> status_type
  (** Deserialize JSON data of type {!status_type}. *)


val write_type' :
  Bi_outbuf.t -> type' -> unit
  (** Output a JSON value of type {!type'}. *)

val string_of_type' :
  ?len:int -> type' -> string
  (** Serialize a value of type {!type'}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type' :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type'
  (** Input JSON data of type {!type'}. *)

val type'_of_string :
  string -> type'
  (** Deserialize JSON data of type {!type'}. *)


val write_message_tags :
  Bi_outbuf.t -> message_tags -> unit
  (** Output a JSON value of type {!message_tags}. *)

val string_of_message_tags :
  ?len:int -> message_tags -> string
  (** Serialize a value of type {!message_tags}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_message_tags :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> message_tags
  (** Input JSON data of type {!message_tags}. *)

val message_tags_of_string :
  string -> message_tags
  (** Deserialize JSON data of type {!message_tags}. *)


val write_story_tags :
  Bi_outbuf.t -> story_tags -> unit
  (** Output a JSON value of type {!story_tags}. *)

val string_of_story_tags :
  ?len:int -> story_tags -> string
  (** Serialize a value of type {!story_tags}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_story_tags :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> story_tags
  (** Input JSON data of type {!story_tags}. *)

val story_tags_of_string :
  string -> story_tags
  (** Deserialize JSON data of type {!story_tags}. *)


val write_action :
  Bi_outbuf.t -> action -> unit
  (** Output a JSON value of type {!action}. *)

val string_of_action :
  ?len:int -> action -> string
  (** Serialize a value of type {!action}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_action :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> action
  (** Input JSON data of type {!action}. *)

val action_of_string :
  string -> action
  (** Deserialize JSON data of type {!action}. *)

val create_action :
  name: string ->
  link: uri ->
  unit -> action
  (** Create a record of type {!action}. *)


val write_application :
  Bi_outbuf.t -> application -> unit
  (** Output a JSON value of type {!application}. *)

val string_of_application :
  ?len:int -> application -> string
  (** Serialize a value of type {!application}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_application :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> application
  (** Input JSON data of type {!application}. *)

val application_of_string :
  string -> application
  (** Deserialize JSON data of type {!application}. *)

val create_application :
  name: string ->
  ?namespace: string ->
  id: id ->
  unit -> application
  (** Create a record of type {!application}. *)


val write_category :
  Bi_outbuf.t -> category -> unit
  (** Output a JSON value of type {!category}. *)

val string_of_category :
  ?len:int -> category -> string
  (** Serialize a value of type {!category}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_category :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> category
  (** Input JSON data of type {!category}. *)

val category_of_string :
  string -> category
  (** Deserialize JSON data of type {!category}. *)

val create_category :
  id: id ->
  name: string ->
  unit -> category
  (** Create a record of type {!category}. *)


val write_user :
  Bi_outbuf.t -> user -> unit
  (** Output a JSON value of type {!user}. *)

val string_of_user :
  ?len:int -> user -> string
  (** Serialize a value of type {!user}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_user :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> user
  (** Input JSON data of type {!user}. *)

val user_of_string :
  string -> user
  (** Deserialize JSON data of type {!user}. *)

val create_user :
  name: string ->
  id: id ->
  ?category: string ->
  ?category_list: category list ->
  unit -> user
  (** Create a record of type {!user}. *)


val write_tag :
  Bi_outbuf.t -> tag -> unit
  (** Output a JSON value of type {!tag}. *)

val string_of_tag :
  ?len:int -> tag -> string
  (** Serialize a value of type {!tag}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tag :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tag
  (** Input JSON data of type {!tag}. *)

val tag_of_string :
  string -> tag
  (** Deserialize JSON data of type {!tag}. *)

val create_tag :
  id: id ->
  name: string ->
  ?type': string ->
  ?offset: int ->
  ?length: int ->
  unit -> tag
  (** Create a record of type {!tag}. *)


val write_privacy :
  Bi_outbuf.t -> privacy -> unit
  (** Output a JSON value of type {!privacy}. *)

val string_of_privacy :
  ?len:int -> privacy -> string
  (** Serialize a value of type {!privacy}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_privacy :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> privacy
  (** Input JSON data of type {!privacy}. *)

val privacy_of_string :
  string -> privacy
  (** Deserialize JSON data of type {!privacy}. *)

val create_privacy :
  value: string ->
  unit -> privacy
  (** Create a record of type {!privacy}. *)


val write_property :
  Bi_outbuf.t -> property -> unit
  (** Output a JSON value of type {!property}. *)

val string_of_property :
  ?len:int -> property -> string
  (** Serialize a value of type {!property}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_property :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> property
  (** Input JSON data of type {!property}. *)

val property_of_string :
  string -> property
  (** Deserialize JSON data of type {!property}. *)

val create_property :
  name: string ->
  text: string ->
  ?href: uri ->
  unit -> property
  (** Create a record of type {!property}. *)


val write_shares :
  Bi_outbuf.t -> shares -> unit
  (** Output a JSON value of type {!shares}. *)

val string_of_shares :
  ?len:int -> shares -> string
  (** Serialize a value of type {!shares}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_shares :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> shares
  (** Input JSON data of type {!shares}. *)

val shares_of_string :
  string -> shares
  (** Deserialize JSON data of type {!shares}. *)

val create_shares :
  count: int ->
  unit -> shares
  (** Create a record of type {!shares}. *)


val write_location :
  Bi_outbuf.t -> location -> unit
  (** Output a JSON value of type {!location}. *)

val string_of_location :
  ?len:int -> location -> string
  (** Serialize a value of type {!location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> location
  (** Input JSON data of type {!location}. *)

val location_of_string :
  string -> location
  (** Deserialize JSON data of type {!location}. *)

val create_location :
  street: string ->
  ?city: string ->
  ?state: string ->
  ?country: string ->
  zip: string ->
  latitude: float ->
  longitude: float ->
  unit -> location
  (** Create a record of type {!location}. *)


val write_place :
  Bi_outbuf.t -> place -> unit
  (** Output a JSON value of type {!place}. *)

val string_of_place :
  ?len:int -> place -> string
  (** Serialize a value of type {!place}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_place :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> place
  (** Input JSON data of type {!place}. *)

val place_of_string :
  string -> place
  (** Deserialize JSON data of type {!place}. *)

val create_place :
  id: id ->
  name: string ->
  location: location ->
  unit -> place
  (** Create a record of type {!place}. *)


val write_to' :
  Bi_outbuf.t -> to' -> unit
  (** Output a JSON value of type {!to'}. *)

val string_of_to' :
  ?len:int -> to' -> string
  (** Serialize a value of type {!to'}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_to' :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> to'
  (** Input JSON data of type {!to'}. *)

val to'_of_string :
  string -> to'
  (** Deserialize JSON data of type {!to'}. *)

val create_to' :
  data: user list ->
  unit -> to'
  (** Create a record of type {!to'}. *)


val write_cursors :
  Bi_outbuf.t -> cursors -> unit
  (** Output a JSON value of type {!cursors}. *)

val string_of_cursors :
  ?len:int -> cursors -> string
  (** Serialize a value of type {!cursors}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_cursors :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> cursors
  (** Input JSON data of type {!cursors}. *)

val cursors_of_string :
  string -> cursors
  (** Deserialize JSON data of type {!cursors}. *)

val create_cursors :
  ?after: string ->
  ?before: string ->
  unit -> cursors
  (** Create a record of type {!cursors}. *)


val write_paging :
  Bi_outbuf.t -> paging -> unit
  (** Output a JSON value of type {!paging}. *)

val string_of_paging :
  ?len:int -> paging -> string
  (** Serialize a value of type {!paging}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_paging :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> paging
  (** Input JSON data of type {!paging}. *)

val paging_of_string :
  string -> paging
  (** Deserialize JSON data of type {!paging}. *)

val create_paging :
  ?cursors: cursors ->
  ?next: uri ->
  ?previous: uri ->
  unit -> paging
  (** Create a record of type {!paging}. *)


val write_likes :
  Bi_outbuf.t -> likes -> unit
  (** Output a JSON value of type {!likes}. *)

val string_of_likes :
  ?len:int -> likes -> string
  (** Serialize a value of type {!likes}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_likes :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> likes
  (** Input JSON data of type {!likes}. *)

val likes_of_string :
  string -> likes
  (** Deserialize JSON data of type {!likes}. *)

val create_likes :
  data: user list ->
  paging: paging ->
  unit -> likes
  (** Create a record of type {!likes}. *)


val write_comment :
  Bi_outbuf.t -> comment -> unit
  (** Output a JSON value of type {!comment}. *)

val string_of_comment :
  ?len:int -> comment -> string
  (** Serialize a value of type {!comment}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_comment :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> comment
  (** Input JSON data of type {!comment}. *)

val comment_of_string :
  string -> comment
  (** Deserialize JSON data of type {!comment}. *)

val create_comment :
  id: string ->
  from: user ->
  message: string ->
  can_remove: bool ->
  created_time: calendar ->
  like_count: int ->
  user_likes: bool ->
  ?message_tags: message_tags ->
  unit -> comment
  (** Create a record of type {!comment}. *)


val write_comments :
  Bi_outbuf.t -> comments -> unit
  (** Output a JSON value of type {!comments}. *)

val string_of_comments :
  ?len:int -> comments -> string
  (** Serialize a value of type {!comments}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_comments :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> comments
  (** Input JSON data of type {!comments}. *)

val comments_of_string :
  string -> comments
  (** Deserialize JSON data of type {!comments}. *)

val create_comments :
  data: comment list ->
  paging: paging ->
  unit -> comments
  (** Create a record of type {!comments}. *)


val write_with_tags :
  Bi_outbuf.t -> with_tags -> unit
  (** Output a JSON value of type {!with_tags}. *)

val string_of_with_tags :
  ?len:int -> with_tags -> string
  (** Serialize a value of type {!with_tags}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_with_tags :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> with_tags
  (** Input JSON data of type {!with_tags}. *)

val with_tags_of_string :
  string -> with_tags
  (** Deserialize JSON data of type {!with_tags}. *)

val create_with_tags :
  data: tag list ->
  unit -> with_tags
  (** Create a record of type {!with_tags}. *)


val write_post :
  Bi_outbuf.t -> post -> unit
  (** Output a JSON value of type {!post}. *)

val string_of_post :
  ?len:int -> post -> string
  (** Serialize a value of type {!post}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_post :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> post
  (** Input JSON data of type {!post}. *)

val post_of_string :
  string -> post
  (** Deserialize JSON data of type {!post}. *)

val create_post :
  id: string ->
  ?actions: action list ->
  ?application: application ->
  ?caption: string ->
  ?comments: comments ->
  created_time: calendar ->
  ?description: string ->
  from: user ->
  ?icon: uri ->
  ?is_hidden: bool ->
  ?likes: likes ->
  ?link: uri ->
  ?message: string ->
  ?message_tags: message_tags ->
  ?name: string ->
  ?object_id: id ->
  ?picture: uri ->
  ?place: place ->
  privacy: privacy ->
  ?properties: property list ->
  ?shares: shares ->
  ?source: uri ->
  ?status_type: status_type ->
  ?story: string ->
  ?story_tags: story_tags ->
  ?to': to' ->
  type': type' ->
  updated_time: calendar ->
  ?with_tags: with_tags ->
  unit -> post
  (** Create a record of type {!post}. *)


val write_response :
  Bi_outbuf.t -> response -> unit
  (** Output a JSON value of type {!response}. *)

val string_of_response :
  ?len:int -> response -> string
  (** Serialize a value of type {!response}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_response :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> response
  (** Input JSON data of type {!response}. *)

val response_of_string :
  string -> response
  (** Deserialize JSON data of type {!response}. *)

val create_response :
  data: post list ->
  ?paging: paging ->
  unit -> response
  (** Create a record of type {!response}. *)



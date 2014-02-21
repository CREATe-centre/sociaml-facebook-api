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

let write_id = (
  Types_ext.write_id
)
let string_of_id ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_id ob x;
  Bi_outbuf.contents ob
let read_id = (
  Types_ext.read_id
)
let id_of_string s =
  read_id (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_uri = (
  Types_ext.write_uri
)
let string_of_uri ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_uri ob x;
  Bi_outbuf.contents ob
let read_uri = (
  Types_ext.read_uri
)
let uri_of_string s =
  read_uri (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_calendar = (
  Types_ext.write_calendar
)
let string_of_calendar ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_calendar ob x;
  Bi_outbuf.contents ob
let read_calendar = (
  Types_ext.read_calendar
)
let calendar_of_string s =
  read_calendar (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_status_type = (
  Types_ext.write_status_type
)
let string_of_status_type ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_status_type ob x;
  Bi_outbuf.contents ob
let read_status_type = (
  Types_ext.read_status_type
)
let status_type_of_string s =
  read_status_type (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_type' = (
  Types_ext.write_type'
)
let string_of_type' ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_type' ob x;
  Bi_outbuf.contents ob
let read_type' = (
  Types_ext.read_type'
)
let type'_of_string s =
  read_type' (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_message_tags = (
  Yojson.Safe.write_json
)
let string_of_message_tags ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_message_tags ob x;
  Bi_outbuf.contents ob
let read_message_tags = (
  Yojson.Safe.read_json
)
let message_tags_of_string s =
  read_message_tags (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_story_tags = (
  Yojson.Safe.write_json
)
let string_of_story_tags ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_story_tags ob x;
  Bi_outbuf.contents ob
let read_story_tags = (
  Yojson.Safe.read_json
)
let story_tags_of_string s =
  read_story_tags (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_action : _ -> action -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"link\":";
    (
      write_uri
    )
      ob x.link;
    Bi_outbuf.add_char ob '}';
)
let string_of_action ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_action ob x;
  Bi_outbuf.contents ob
let read_action = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : action) =
      {
        name = Obj.magic 0.0;
        link = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 4 then (
            match String.unsafe_get s pos with
              | 'l' -> (
                  if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'k' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 15, characters 14-60" (String.sub s pos len); -1
                  )
                )
              | 'n' -> (
                  if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 15, characters 14-60" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 15, characters 14-60" (String.sub s pos len); -1
                )
          )
          else (
            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 15, characters 14-60" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                read_uri
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 4 then (
              match String.unsafe_get s pos with
                | 'l' -> (
                    if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'k' then (
                      1
                    )
                    else (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 15, characters 14-60" (String.sub s pos len); -1
                    )
                  )
                | 'n' -> (
                    if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 15, characters 14-60" (String.sub s pos len); -1
                    )
                  )
                | _ -> (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 15, characters 14-60" (String.sub s pos len); -1
                  )
            )
            else (
              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 15, characters 14-60" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  read_uri
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "name"; "link" |];
        Ag_oj_run.identity x
      )
)
let action_of_string s =
  read_action (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__1 = (
  Ag_oj_run.write_std_option (
    Yojson.Safe.write_string
  )
)
let string_of__1 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__1 ob x;
  Bi_outbuf.contents ob
let read__1 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  Ag_oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Ag_oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _1_of_string s =
  read__1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_application : _ -> application -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    (match x.namespace with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"namespace\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      write_id
    )
      ob x.id;
    Bi_outbuf.add_char ob '}';
)
let string_of_application ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_application ob x;
  Bi_outbuf.contents ob
let read_application = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : application) =
      {
        name = Obj.magic 0.0;
        namespace = None;
        id = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  2
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 20, characters 19-82" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 20, characters 19-82" (String.sub s pos len); -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'p' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'c' && String.unsafe_get s (pos+8) = 'e' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 20, characters 19-82" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 20, characters 19-82" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            )
          | 2 ->
            let v =
              (
                read_id
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    2
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 20, characters 19-82" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 20, characters 19-82" (String.sub s pos len); -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' && String.unsafe_get s (pos+5) = 'p' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'c' && String.unsafe_get s (pos+8) = 'e' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 20, characters 19-82" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 20, characters 19-82" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              )
            | 2 ->
              let v =
                (
                  read_id
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "name"; "id" |];
        Ag_oj_run.identity x
      )
)
let application_of_string s =
  read_application (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_category : _ -> category -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      write_id
    )
      ob x.id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    Bi_outbuf.add_char ob '}';
)
let string_of_category ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_category ob x;
  Bi_outbuf.contents ob
let read_category = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : category) =
      {
        id = Obj.magic 0.0;
        name = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 26, characters 16-49" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 26, characters 16-49" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 26, characters 16-49" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                read_id
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 26, characters 16-49" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 26, characters 16-49" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 26, characters 16-49" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  read_id
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "id"; "name" |];
        Ag_oj_run.identity x
      )
)
let category_of_string s =
  read_category (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__2 = (
  Ag_oj_run.write_list (
    write_category
  )
)
let string_of__2 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__2 ob x;
  Bi_outbuf.contents ob
let read__2 = (
  Ag_oj_run.read_list (
    read_category
  )
)
let _2_of_string s =
  read__2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__3 = (
  Ag_oj_run.write_std_option (
    write__2
  )
)
let string_of__3 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__3 ob x;
  Bi_outbuf.contents ob
let read__3 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read__2
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__2
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _3_of_string s =
  read__3 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_user : _ -> user -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      write_id
    )
      ob x.id;
    (match x.category with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"category\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.category_list with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"category_list\":";
      (
        write__2
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_user ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_user ob x;
  Bi_outbuf.contents ob
let read_user = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : user) =
      {
        name = Obj.magic 0.0;
        id = Obj.magic 0.0;
        category = None;
        category_list = None;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'g' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'y' then (
                  2
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'g' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'l' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' then (
                  3
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                read_id
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read__2
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'g' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'y' then (
                    2
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'g' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'y' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 'l' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 't' then (
                    3
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 31, characters 12-125" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  read_id
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read__2
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "name"; "id" |];
        Ag_oj_run.identity x
      )
)
let user_of_string s =
  read_user (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__4 = (
  Ag_oj_run.write_std_option (
    Yojson.Safe.write_int
  )
)
let string_of__4 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__4 ob x;
  Bi_outbuf.contents ob
let read__4 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  Ag_oj_run.read_int
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Ag_oj_run.read_int
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _4_of_string s =
  read__4 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_tag : _ -> tag -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      write_id
    )
      ob x.id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    (match x.type' with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"type\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.offset with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"offset\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    (match x.length with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"length\":";
      (
        Yojson.Safe.write_int
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_tag ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_tag ob x;
  Bi_outbuf.contents ob
let read_tag = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : tag) =
      {
        id = Obj.magic 0.0;
        name = Obj.magic 0.0;
        type' = None;
        offset = None;
        length = None;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'n' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                        1
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' then (
                        2
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                    )
              )
            | 6 -> (
                match String.unsafe_get s pos with
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'h' then (
                        4
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                      )
                    )
                  | 'o' -> (
                      if String.unsafe_get s (pos+1) = 'f' && String.unsafe_get s (pos+2) = 'f' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' then (
                        3
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                    )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                read_id
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_int
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_int
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'n' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' then (
                          2
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                      )
                )
              | 6 -> (
                  match String.unsafe_get s pos with
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'h' then (
                          4
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                        )
                      )
                    | 'o' -> (
                        if String.unsafe_get s (pos+1) = 'f' && String.unsafe_get s (pos+2) = 'f' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' then (
                          3
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                      )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 38, characters 11-147" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  read_id
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_int
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_int
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "id"; "name" |];
        Ag_oj_run.identity x
      )
)
let tag_of_string s =
  read_tag (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_privacy : _ -> privacy -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"value\":";
    (
      Yojson.Safe.write_string
    )
      ob x.value;
    Bi_outbuf.add_char ob '}';
)
let string_of_privacy ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_privacy ob x;
  Bi_outbuf.contents ob
let read_privacy = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : privacy) =
      {
        value = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
            0
          )
          else (
            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 46, characters 15-38" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
              0
            )
            else (
              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 46, characters 15-38" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields [| !bits0 |] [| "value" |];
        Ag_oj_run.identity x
      )
)
let privacy_of_string s =
  read_privacy (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__5 = (
  Ag_oj_run.write_std_option (
    write_uri
  )
)
let string_of__5 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__5 ob x;
  Bi_outbuf.contents ob
let read__5 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_uri
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_uri
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _5_of_string s =
  read__5 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_property : _ -> property -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"text\":";
    (
      Yojson.Safe.write_string
    )
      ob x.text;
    (match x.href with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"href\":";
      (
        write_uri
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_property ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_property ob x;
  Bi_outbuf.contents ob
let read_property = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : property) =
      {
        name = Obj.magic 0.0;
        text = Obj.magic 0.0;
        href = None;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 4 then (
            match String.unsafe_get s pos with
              | 'h' -> (
                  if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'f' then (
                    2
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
                  )
                )
              | 'n' -> (
                  if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
                  )
                )
              | 't' -> (
                  if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 't' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
                )
          )
          else (
            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_uri
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 4 then (
              match String.unsafe_get s pos with
                | 'h' -> (
                    if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'f' then (
                      2
                    )
                    else (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
                    )
                  )
                | 'n' -> (
                    if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
                    )
                  )
                | 't' -> (
                    if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 't' then (
                      1
                    )
                    else (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
                    )
                  )
                | _ -> (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
                  )
            )
            else (
              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 50, characters 16-87" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_uri
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "name"; "text" |];
        Ag_oj_run.identity x
      )
)
let property_of_string s =
  read_property (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_shares : _ -> shares -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"count\":";
    (
      Yojson.Safe.write_int
    )
      ob x.count;
    Bi_outbuf.add_char ob '}';
)
let string_of_shares ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_shares ob x;
  Bi_outbuf.contents ob
let read_shares = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : shares) =
      {
        count = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 5 && String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' then (
            0
          )
          else (
            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 56, characters 14-34" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 5 && String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' then (
              0
            )
            else (
              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 56, characters 14-34" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields [| !bits0 |] [| "count" |];
        Ag_oj_run.identity x
      )
)
let shares_of_string s =
  read_shares (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_location : _ -> location -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"street\":";
    (
      Yojson.Safe.write_string
    )
      ob x.street;
    (match x.city with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"city\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.state with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"state\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.country with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"country\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"zip\":";
    (
      Yojson.Safe.write_string
    )
      ob x.zip;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"latitude\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.latitude;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"longitude\":";
    (
      Yojson.Safe.write_std_float
    )
      ob x.longitude;
    Bi_outbuf.add_char ob '}';
)
let string_of_location ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_location ob x;
  Bi_outbuf.contents ob
let read_location = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : location) =
      {
        street = Obj.magic 0.0;
        city = None;
        state = None;
        country = None;
        zip = Obj.magic 0.0;
        latitude = Obj.magic 0.0;
        longitude = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 'z' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'p' then (
                  4
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'y' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' then (
                  2
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'y' then (
                  3
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'e' then (
                  5
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'e' then (
                  6
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            )
          | 4 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 5 ->
            let v =
              (
                Ag_oj_run.read_number
              ) p lb
            in
            Obj.set_field (Obj.repr x) 5 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 6 ->
            let v =
              (
                Ag_oj_run.read_number
              ) p lb
            in
            Obj.set_field (Obj.repr x) 6 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'z' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'p' then (
                    4
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'y' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' then (
                    2
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'y' then (
                    3
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'e' then (
                    5
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'e' then (
                    6
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 60, characters 16-176" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              )
            | 4 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 5 ->
              let v =
                (
                  Ag_oj_run.read_number
                ) p lb
              in
              Obj.set_field (Obj.repr x) 5 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 6 ->
              let v =
                (
                  Ag_oj_run.read_number
                ) p lb
              in
              Obj.set_field (Obj.repr x) 6 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0xf then Ag_oj_run.missing_fields [| !bits0 |] [| "street"; "zip"; "latitude"; "longitude" |];
        Ag_oj_run.identity x
      )
)
let location_of_string s =
  read_location (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_place : _ -> place -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      write_id
    )
      ob x.id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"location\":";
    (
      write_location
    )
      ob x.location;
    Bi_outbuf.add_char ob '}';
)
let string_of_place ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_place ob x;
  Bi_outbuf.contents ob
let read_place = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : place) =
      {
        id = Obj.magic 0.0;
        name = Obj.magic 0.0;
        location = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 70, characters 13-69" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 70, characters 13-69" (String.sub s pos len); -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                  2
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 70, characters 13-69" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 70, characters 13-69" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                read_id
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                read_location
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 70, characters 13-69" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 70, characters 13-69" (String.sub s pos len); -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                    2
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 70, characters 13-69" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 70, characters 13-69" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  read_id
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  read_location
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7 then Ag_oj_run.missing_fields [| !bits0 |] [| "id"; "name"; "location" |];
        Ag_oj_run.identity x
      )
)
let place_of_string s =
  read_place (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__6 = (
  Ag_oj_run.write_list (
    write_user
  )
)
let string_of__6 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__6 ob x;
  Bi_outbuf.contents ob
let read__6 = (
  Ag_oj_run.read_list (
    read_user
  )
)
let _6_of_string s =
  read__6 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_to' : _ -> to' -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"data\":";
    (
      write__6
    )
      ob x.data;
    Bi_outbuf.add_char ob '}';
)
let string_of_to' ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_to' ob x;
  Bi_outbuf.contents ob
let read_to' = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : to') =
      {
        data = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 4 && String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
            0
          )
          else (
            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 76, characters 11-36" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                read__6
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 4 && String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
              0
            )
            else (
              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 76, characters 11-36" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  read__6
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields [| !bits0 |] [| "data" |];
        Ag_oj_run.identity x
      )
)
let to'_of_string s =
  read_to' (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_cursors : _ -> cursors -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.after with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"after\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.before with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"before\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_cursors ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_cursors ob x;
  Bi_outbuf.contents ob
let read_cursors = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : cursors) =
      {
        after = None;
        before = (fun x -> x) (None);
      }
    in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'f' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 137, characters 15-73" (String.sub s pos len); -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'f' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 137, characters 15-73" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 137, characters 15-73" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'f' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 137, characters 15-73" (String.sub s pos len); -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'f' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 137, characters 15-73" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 137, characters 15-73" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        Ag_oj_run.identity x
      )
)
let cursors_of_string s =
  read_cursors (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__25 = (
  Ag_oj_run.write_std_option (
    write_cursors
  )
)
let string_of__25 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__25 ob x;
  Bi_outbuf.contents ob
let read__25 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_cursors
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_cursors
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _25_of_string s =
  read__25 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_paging : _ -> paging -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    (match x.cursors with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"cursors\":";
      (
        write_cursors
      )
        ob x;
    );
    (match x.next with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"next\":";
      (
        write_uri
      )
        ob x;
    );
    (match x.previous with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"previous\":";
      (
        write_uri
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_paging ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_paging ob x;
  Bi_outbuf.contents ob
let read_paging = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : paging) =
      {
        cursors = None;
        next = None;
        previous = (fun x -> x) (None);
      }
    in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 't' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 142, characters 14-96" (String.sub s pos len); -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 's' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 142, characters 14-96" (String.sub s pos len); -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 's' then (
                  2
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 142, characters 14-96" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 142, characters 14-96" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_cursors
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_uri
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_uri
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 't' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 142, characters 14-96" (String.sub s pos len); -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 's' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 142, characters 14-96" (String.sub s pos len); -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 's' then (
                    2
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 142, characters 14-96" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 142, characters 14-96" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_cursors
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_uri
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_uri
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        Ag_oj_run.identity x
      )
)
let paging_of_string s =
  read_paging (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_likes : _ -> likes -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"data\":";
    (
      write__6
    )
      ob x.data;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"paging\":";
    (
      write_paging
    )
      ob x.paging;
    Bi_outbuf.add_char ob '}';
)
let string_of_likes ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_likes ob x;
  Bi_outbuf.contents ob
let read_likes = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : likes) =
      {
        data = Obj.magic 0.0;
        paging = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 80, characters 13-57" (String.sub s pos len); -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'g' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 80, characters 13-57" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 80, characters 13-57" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                read__6
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                read_paging
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 80, characters 13-57" (String.sub s pos len); -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'g' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 80, characters 13-57" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 80, characters 13-57" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  read__6
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  read_paging
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "data"; "paging" |];
        Ag_oj_run.identity x
      )
)
let likes_of_string s =
  read_likes (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__7 = (
  Ag_oj_run.write_std_option (
    write_message_tags
  )
)
let string_of__7 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__7 ob x;
  Bi_outbuf.contents ob
let read__7 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_message_tags
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_message_tags
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _7_of_string s =
  read__7 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_comment : _ -> comment -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"from\":";
    (
      write_user
    )
      ob x.from;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"message\":";
    (
      Yojson.Safe.write_string
    )
      ob x.message;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"can_remove\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.can_remove;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"created_time\":";
    (
      write_calendar
    )
      ob x.created_time;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"like_count\":";
    (
      Yojson.Safe.write_int
    )
      ob x.like_count;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"user_likes\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.user_likes;
    (match x.message_tags with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"message_tags\":";
      (
        write_message_tags
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_comment ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_comment ob x;
  Bi_outbuf.contents ob
let read_comment = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : comment) =
      {
        id = Obj.magic 0.0;
        from = Obj.magic 0.0;
        message = Obj.magic 0.0;
        can_remove = Obj.magic 0.0;
        created_time = Obj.magic 0.0;
        like_count = Obj.magic 0.0;
        user_likes = Obj.magic 0.0;
        message_tags = None;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                  2
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                )
              )
            | 10 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'v' && String.unsafe_get s (pos+9) = 'e' then (
                        3
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                      )
                    )
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 't' then (
                        5
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
                        6
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                    )
              )
            | 12 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 'e' then (
                        4
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                      )
                    )
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'g' && String.unsafe_get s (pos+11) = 's' then (
                        7
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                    )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                read_user
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                Ag_oj_run.read_bool
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | 4 ->
            let v =
              (
                read_calendar
              ) p lb
            in
            Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            bits0 := !bits0 lor 0x10;
          | 5 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 5 (Obj.repr v);
            bits0 := !bits0 lor 0x20;
          | 6 ->
            let v =
              (
                Ag_oj_run.read_bool
              ) p lb
            in
            Obj.set_field (Obj.repr x) 6 (Obj.repr v);
            bits0 := !bits0 lor 0x40;
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_message_tags
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 7 (Obj.repr v);
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                    2
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                  )
                )
              | 10 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'v' && String.unsafe_get s (pos+9) = 'e' then (
                          3
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                        )
                      )
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 't' then (
                          5
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'k' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
                          6
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                      )
                )
              | 12 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 'e' then (
                          4
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                        )
                      )
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'g' && String.unsafe_get s (pos+11) = 's' then (
                          7
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                      )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 85, characters 15-198" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  read_user
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  Ag_oj_run.read_bool
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | 4 ->
              let v =
                (
                  read_calendar
                ) p lb
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              bits0 := !bits0 lor 0x10;
            | 5 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 5 (Obj.repr v);
              bits0 := !bits0 lor 0x20;
            | 6 ->
              let v =
                (
                  Ag_oj_run.read_bool
                ) p lb
              in
              Obj.set_field (Obj.repr x) 6 (Obj.repr v);
              bits0 := !bits0 lor 0x40;
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_message_tags
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 7 (Obj.repr v);
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7f then Ag_oj_run.missing_fields [| !bits0 |] [| "id"; "from"; "message"; "can_remove"; "created_time"; "like_count"; "user_likes" |];
        Ag_oj_run.identity x
      )
)
let comment_of_string s =
  read_comment (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__8 = (
  Ag_oj_run.write_list (
    write_comment
  )
)
let string_of__8 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__8 ob x;
  Bi_outbuf.contents ob
let read__8 = (
  Ag_oj_run.read_list (
    read_comment
  )
)
let _8_of_string s =
  read__8 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_comments : _ -> comments -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"data\":";
    (
      write__8
    )
      ob x.data;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"paging\":";
    (
      write_paging
    )
      ob x.paging;
    Bi_outbuf.add_char ob '}';
)
let string_of_comments ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_comments ob x;
  Bi_outbuf.contents ob
let read_comments = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : comments) =
      {
        data = Obj.magic 0.0;
        paging = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 96, characters 16-63" (String.sub s pos len); -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'g' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 96, characters 16-63" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 96, characters 16-63" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                read__8
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                read_paging
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 96, characters 16-63" (String.sub s pos len); -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'g' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 96, characters 16-63" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 96, characters 16-63" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  read__8
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  read_paging
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "data"; "paging" |];
        Ag_oj_run.identity x
      )
)
let comments_of_string s =
  read_comments (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__9 = (
  Ag_oj_run.write_list (
    write_tag
  )
)
let string_of__9 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__9 ob x;
  Bi_outbuf.contents ob
let read__9 = (
  Ag_oj_run.read_list (
    read_tag
  )
)
let _9_of_string s =
  read__9 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_with_tags : _ -> with_tags -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"data\":";
    (
      write__9
    )
      ob x.data;
    Bi_outbuf.add_char ob '}';
)
let string_of_with_tags ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_with_tags ob x;
  Bi_outbuf.contents ob
let read_with_tags = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : with_tags) =
      {
        data = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 4 && String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
            0
          )
          else (
            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 101, characters 17-41" (String.sub s pos len); -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                read__9
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 4 && String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
              0
            )
            else (
              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 101, characters 17-41" (String.sub s pos len); -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  read__9
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields [| !bits0 |] [| "data" |];
        Ag_oj_run.identity x
      )
)
let with_tags_of_string s =
  read_with_tags (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__10 = (
  Ag_oj_run.write_list (
    write_action
  )
)
let string_of__10 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__10 ob x;
  Bi_outbuf.contents ob
let read__10 = (
  Ag_oj_run.read_list (
    read_action
  )
)
let _10_of_string s =
  read__10 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__11 = (
  Ag_oj_run.write_std_option (
    write__10
  )
)
let string_of__11 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__11 ob x;
  Bi_outbuf.contents ob
let read__11 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read__10
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__10
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _11_of_string s =
  read__11 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__12 = (
  Ag_oj_run.write_std_option (
    write_application
  )
)
let string_of__12 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__12 ob x;
  Bi_outbuf.contents ob
let read__12 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_application
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_application
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _12_of_string s =
  read__12 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__13 = (
  Ag_oj_run.write_std_option (
    write_comments
  )
)
let string_of__13 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__13 ob x;
  Bi_outbuf.contents ob
let read__13 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_comments
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_comments
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _13_of_string s =
  read__13 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__14 = (
  Ag_oj_run.write_std_option (
    Yojson.Safe.write_bool
  )
)
let string_of__14 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__14 ob x;
  Bi_outbuf.contents ob
let read__14 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  Ag_oj_run.read_bool
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Ag_oj_run.read_bool
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _14_of_string s =
  read__14 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__15 = (
  Ag_oj_run.write_std_option (
    write_likes
  )
)
let string_of__15 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__15 ob x;
  Bi_outbuf.contents ob
let read__15 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_likes
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_likes
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _15_of_string s =
  read__15 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__16 = (
  Ag_oj_run.write_std_option (
    write_id
  )
)
let string_of__16 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__16 ob x;
  Bi_outbuf.contents ob
let read__16 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_id
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_id
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _16_of_string s =
  read__16 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__17 = (
  Ag_oj_run.write_std_option (
    write_place
  )
)
let string_of__17 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__17 ob x;
  Bi_outbuf.contents ob
let read__17 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_place
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_place
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _17_of_string s =
  read__17 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__18 = (
  Ag_oj_run.write_list (
    write_property
  )
)
let string_of__18 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__18 ob x;
  Bi_outbuf.contents ob
let read__18 = (
  Ag_oj_run.read_list (
    read_property
  )
)
let _18_of_string s =
  read__18 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__19 = (
  Ag_oj_run.write_std_option (
    write__18
  )
)
let string_of__19 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__19 ob x;
  Bi_outbuf.contents ob
let read__19 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read__18
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__18
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _19_of_string s =
  read__19 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__20 = (
  Ag_oj_run.write_std_option (
    write_shares
  )
)
let string_of__20 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__20 ob x;
  Bi_outbuf.contents ob
let read__20 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_shares
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_shares
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _20_of_string s =
  read__20 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__21 = (
  Ag_oj_run.write_std_option (
    write_status_type
  )
)
let string_of__21 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__21 ob x;
  Bi_outbuf.contents ob
let read__21 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_status_type
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_status_type
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _21_of_string s =
  read__21 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__22 = (
  Ag_oj_run.write_std_option (
    write_story_tags
  )
)
let string_of__22 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__22 ob x;
  Bi_outbuf.contents ob
let read__22 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_story_tags
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_story_tags
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _22_of_string s =
  read__22 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__23 = (
  Ag_oj_run.write_std_option (
    write_to'
  )
)
let string_of__23 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__23 ob x;
  Bi_outbuf.contents ob
let read__23 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_to'
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_to'
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _23_of_string s =
  read__23 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__24 = (
  Ag_oj_run.write_std_option (
    write_with_tags
  )
)
let string_of__24 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__24 ob x;
  Bi_outbuf.contents ob
let read__24 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_with_tags
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_with_tags
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _24_of_string s =
  read__24 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_post : _ -> post -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.id;
    (match x.actions with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"actions\":";
      (
        write__10
      )
        ob x;
    );
    (match x.application with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"application\":";
      (
        write_application
      )
        ob x;
    );
    (match x.caption with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"caption\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.comments with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"comments\":";
      (
        write_comments
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"created_time\":";
    (
      write_calendar
    )
      ob x.created_time;
    (match x.description with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"description\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"from\":";
    (
      write_user
    )
      ob x.from;
    (match x.icon with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"icon\":";
      (
        write_uri
      )
        ob x;
    );
    (match x.is_hidden with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"is_hidden\":";
      (
        Yojson.Safe.write_bool
      )
        ob x;
    );
    (match x.likes with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"likes\":";
      (
        write_likes
      )
        ob x;
    );
    (match x.link with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"link\":";
      (
        write_uri
      )
        ob x;
    );
    (match x.message with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"message\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.message_tags with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"message_tags\":";
      (
        write_message_tags
      )
        ob x;
    );
    (match x.name with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.object_id with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"object_id\":";
      (
        write_id
      )
        ob x;
    );
    (match x.picture with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"picture\":";
      (
        write_uri
      )
        ob x;
    );
    (match x.place with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"place\":";
      (
        write_place
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"privacy\":";
    (
      write_privacy
    )
      ob x.privacy;
    (match x.properties with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"properties\":";
      (
        write__18
      )
        ob x;
    );
    (match x.shares with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"shares\":";
      (
        write_shares
      )
        ob x;
    );
    (match x.source with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"source\":";
      (
        write_uri
      )
        ob x;
    );
    (match x.status_type with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"status_type\":";
      (
        write_status_type
      )
        ob x;
    );
    (match x.story with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"story\":";
      (
        Yojson.Safe.write_string
      )
        ob x;
    );
    (match x.story_tags with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"story_tags\":";
      (
        write_story_tags
      )
        ob x;
    );
    (match x.to' with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"to\":";
      (
        write_to'
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"type\":";
    (
      write_type'
    )
      ob x.type';
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"updated_time\":";
    (
      write_calendar
    )
      ob x.updated_time;
    (match x.with_tags with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"with_tags\":";
      (
        write_with_tags
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_post ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_post ob x;
  Bi_outbuf.contents ob
let read_post = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : post) =
      {
        id = Obj.magic 0.0;
        actions = None;
        application = None;
        caption = None;
        comments = None;
        created_time = Obj.magic 0.0;
        description = None;
        from = Obj.magic 0.0;
        icon = None;
        is_hidden = None;
        likes = None;
        link = None;
        message = None;
        message_tags = None;
        name = None;
        object_id = None;
        picture = None;
        place = None;
        privacy = Obj.magic 0.0;
        properties = None;
        shares = None;
        source = None;
        status_type = None;
        story = None;
        story_tags = None;
        to' = None;
        type' = Obj.magic 0.0;
        updated_time = Obj.magic 0.0;
        with_tags = None;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                match String.unsafe_get s pos with
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 'd' then (
                        0
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'o' then (
                        25
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                    )
              )
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'f' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' then (
                        7
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'n' then (
                        8
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'k' then (
                        11
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'n' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                        14
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' then (
                        26
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                    )
              )
            | 5 -> (
                match String.unsafe_get s pos with
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                        10
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'l' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' then (
                        17
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'y' then (
                        23
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                    )
              )
            | 6 -> (
                if String.unsafe_get s pos = 's' then (
                  match String.unsafe_get s (pos+1) with
                    | 'h' -> (
                        if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' then (
                          20
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'o' -> (
                        if String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'e' then (
                          21
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'a' -> (
                      if String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 's' then (
                        1
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                        3
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                        12
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'p' -> (
                      match String.unsafe_get s (pos+1) with
                        | 'i' -> (
                            if String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' then (
                              16
                            )
                            else (
                              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                            )
                          )
                        | 'r' -> (
                            if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'y' then (
                              18
                            )
                            else (
                              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                            )
                          )
                        | _ -> (
                            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                          )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                    )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 's' then (
                  4
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                )
              )
            | 9 -> (
                match String.unsafe_get s pos with
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' then (
                        9
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'o' -> (
                      if String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = 'j' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'd' then (
                        15
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'w' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'g' && String.unsafe_get s (pos+8) = 's' then (
                        28
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                    )
              )
            | 10 -> (
                match String.unsafe_get s pos with
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
                        19
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'y' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'g' && String.unsafe_get s (pos+9) = 's' then (
                        24
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                    )
              )
            | 11 -> (
                match String.unsafe_get s pos with
                  | 'a' -> (
                      if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                        2
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'd' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                        6
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 's' -> (
                      if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'y' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'e' then (
                        22
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                    )
              )
            | 12 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 'e' then (
                        5
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'g' && String.unsafe_get s (pos+11) = 's' then (
                        13
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 'e' then (
                        27
                      )
                      else (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                    )
                  | _ -> (
                      ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                    )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read__10
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_application
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            )
          | 3 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            )
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_comments
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            )
          | 5 ->
            let v =
              (
                read_calendar
              ) p lb
            in
            Obj.set_field (Obj.repr x) 5 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 6 (Obj.repr v);
            )
          | 7 ->
            let v =
              (
                read_user
              ) p lb
            in
            Obj.set_field (Obj.repr x) 7 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_uri
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 8 (Obj.repr v);
            )
          | 9 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_bool
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 9 (Obj.repr v);
            )
          | 10 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_likes
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 10 (Obj.repr v);
            )
          | 11 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_uri
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 11 (Obj.repr v);
            )
          | 12 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 12 (Obj.repr v);
            )
          | 13 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_message_tags
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 13 (Obj.repr v);
            )
          | 14 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 14 (Obj.repr v);
            )
          | 15 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_id
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 15 (Obj.repr v);
            )
          | 16 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_uri
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 16 (Obj.repr v);
            )
          | 17 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_place
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 17 (Obj.repr v);
            )
          | 18 ->
            let v =
              (
                read_privacy
              ) p lb
            in
            Obj.set_field (Obj.repr x) 18 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | 19 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read__18
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 19 (Obj.repr v);
            )
          | 20 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_shares
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 20 (Obj.repr v);
            )
          | 21 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_uri
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 21 (Obj.repr v);
            )
          | 22 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_status_type
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 22 (Obj.repr v);
            )
          | 23 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    Ag_oj_run.read_string
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 23 (Obj.repr v);
            )
          | 24 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_story_tags
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 24 (Obj.repr v);
            )
          | 25 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_to'
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 25 (Obj.repr v);
            )
          | 26 ->
            let v =
              (
                read_type'
              ) p lb
            in
            Obj.set_field (Obj.repr x) 26 (Obj.repr v);
            bits0 := !bits0 lor 0x10;
          | 27 ->
            let v =
              (
                read_calendar
              ) p lb
            in
            Obj.set_field (Obj.repr x) 27 (Obj.repr v);
            bits0 := !bits0 lor 0x20;
          | 28 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_with_tags
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 28 (Obj.repr v);
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  match String.unsafe_get s pos with
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 'd' then (
                          0
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'o' then (
                          25
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'f' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' then (
                          7
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'n' then (
                          8
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'k' then (
                          11
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'n' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          14
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' then (
                          26
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
              | 5 -> (
                  match String.unsafe_get s pos with
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                          10
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'l' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' then (
                          17
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'y' then (
                          23
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 's' then (
                    match String.unsafe_get s (pos+1) with
                      | 'h' -> (
                          if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' then (
                            20
                          )
                          else (
                            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                          )
                        )
                      | 'o' -> (
                          if String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'e' then (
                            21
                          )
                          else (
                            ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                          )
                        )
                      | _ -> (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                  )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'a' -> (
                        if String.unsafe_get s (pos+1) = 'c' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 's' then (
                          1
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                          3
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' then (
                          12
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'p' -> (
                        match String.unsafe_get s (pos+1) with
                          | 'i' -> (
                              if String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'e' then (
                                16
                              )
                              else (
                                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                              )
                            )
                          | 'r' -> (
                              if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'y' then (
                                18
                              )
                              else (
                                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                              )
                            )
                          | _ -> (
                              ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                            )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 's' then (
                    4
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                  )
                )
              | 9 -> (
                  match String.unsafe_get s pos with
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' then (
                          9
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'o' -> (
                        if String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = 'j' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'd' then (
                          15
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'w' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'g' && String.unsafe_get s (pos+8) = 's' then (
                          28
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
              | 10 -> (
                  match String.unsafe_get s pos with
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 's' then (
                          19
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'y' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'g' && String.unsafe_get s (pos+9) = 's' then (
                          24
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
              | 11 -> (
                  match String.unsafe_get s pos with
                    | 'a' -> (
                        if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                          2
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' then (
                          6
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 's' -> (
                        if String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'y' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'e' then (
                          22
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
              | 12 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 'e' then (
                          5
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'g' && String.unsafe_get s (pos+11) = 's' then (
                          13
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | 'u' -> (
                        if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 'e' then (
                          27
                        )
                        else (
                          ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                        )
                      )
                    | _ -> (
                        ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                      )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 105, characters 12-842" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read__10
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_application
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              )
            | 3 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              )
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_comments
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              )
            | 5 ->
              let v =
                (
                  read_calendar
                ) p lb
              in
              Obj.set_field (Obj.repr x) 5 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 6 (Obj.repr v);
              )
            | 7 ->
              let v =
                (
                  read_user
                ) p lb
              in
              Obj.set_field (Obj.repr x) 7 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_uri
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 8 (Obj.repr v);
              )
            | 9 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_bool
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 9 (Obj.repr v);
              )
            | 10 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_likes
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 10 (Obj.repr v);
              )
            | 11 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_uri
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 11 (Obj.repr v);
              )
            | 12 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 12 (Obj.repr v);
              )
            | 13 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_message_tags
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 13 (Obj.repr v);
              )
            | 14 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 14 (Obj.repr v);
              )
            | 15 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_id
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 15 (Obj.repr v);
              )
            | 16 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_uri
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 16 (Obj.repr v);
              )
            | 17 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_place
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 17 (Obj.repr v);
              )
            | 18 ->
              let v =
                (
                  read_privacy
                ) p lb
              in
              Obj.set_field (Obj.repr x) 18 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | 19 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read__18
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 19 (Obj.repr v);
              )
            | 20 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_shares
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 20 (Obj.repr v);
              )
            | 21 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_uri
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 21 (Obj.repr v);
              )
            | 22 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_status_type
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 22 (Obj.repr v);
              )
            | 23 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      Ag_oj_run.read_string
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 23 (Obj.repr v);
              )
            | 24 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_story_tags
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 24 (Obj.repr v);
              )
            | 25 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_to'
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 25 (Obj.repr v);
              )
            | 26 ->
              let v =
                (
                  read_type'
                ) p lb
              in
              Obj.set_field (Obj.repr x) 26 (Obj.repr v);
              bits0 := !bits0 lor 0x10;
            | 27 ->
              let v =
                (
                  read_calendar
                ) p lb
              in
              Obj.set_field (Obj.repr x) 27 (Obj.repr v);
              bits0 := !bits0 lor 0x20;
            | 28 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_with_tags
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 28 (Obj.repr v);
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3f then Ag_oj_run.missing_fields [| !bits0 |] [| "id"; "created_time"; "from"; "privacy"; "type'"; "updated_time" |];
        Ag_oj_run.identity x
      )
)
let post_of_string s =
  read_post (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__26 = (
  Ag_oj_run.write_list (
    write_post
  )
)
let string_of__26 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__26 ob x;
  Bi_outbuf.contents ob
let read__26 = (
  Ag_oj_run.read_list (
    read_post
  )
)
let _26_of_string s =
  read__26 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__27 = (
  Ag_oj_run.write_std_option (
    write_paging
  )
)
let string_of__27 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__27 ob x;
  Bi_outbuf.contents ob
let read__27 = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 then (
                  match String.unsafe_get s pos with
                    | 'N' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                          0
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | 'S' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          raise (Exit)
                        )
                      )
                    | _ -> (
                        raise (Exit)
                      )
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | 1 ->
              Ag_oj_run.read_until_field_value p lb;
              let x = (
                  read_paging
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
      | `Double_quote -> (
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'N' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_string p f lb in
          match i with
            | 0 ->
              (None : _ option)
            | _ -> (
                assert false
              )
        )
      | `Square_bracket -> (
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              try
                if len = 4 && String.unsafe_get s pos = 'S' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  raise (Exit)
                )
              with Exit -> (
                  Ag_oj_run.invalid_variant_tag (String.sub s pos len)
                )
          in
          let i = Yojson.Safe.map_ident p f lb in
          match i with
            | 0 ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_paging
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | _ -> (
                assert false
              )
        )
)
let _27_of_string s =
  read__27 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_response : _ -> response -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"data\":";
    (
      write__26
    )
      ob x.data;
    (match x.paging with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"paging\":";
      (
        write_paging
      )
        ob x;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_response ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_response ob x;
  Bi_outbuf.contents ob
let read_response = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let (x : response) =
      {
        data = Obj.magic 0.0;
        paging = None;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                  0
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 148, characters 16-67" (String.sub s pos len); -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'g' then (
                  1
                )
                else (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 148, characters 16-67" (String.sub s pos len); -1
                )
              )
            | _ -> (
                ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 148, characters 16-67" (String.sub s pos len); -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                read__26
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              let v =
                Some (
                  (
                    read_paging
                  ) p lb
                )
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                    0
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 148, characters 16-67" (String.sub s pos len); -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'g' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'g' then (
                    1
                  )
                  else (
                    ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 148, characters 16-67" (String.sub s pos len); -1
                  )
                )
              | _ -> (
                  ((fun a b -> Printf.printf "Unknown field: %s\t(%s)\n" b a)) "File \"src/types.atd\", line 148, characters 16-67" (String.sub s pos len); -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  read__26
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                let v =
                  Some (
                    (
                      read_paging
                    ) p lb
                  )
                in
                Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields [| !bits0 |] [| "data" |];
        Ag_oj_run.identity x
      )
)
let response_of_string s =
  read_response (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let create_action 
  ~name
  ~link
  () : action =
  {
    name = name;
    link = link;
  }
let create_application 
  ~name
  ?namespace
  ~id
  () : application =
  {
    name = name;
    namespace = namespace;
    id = id;
  }
let create_category 
  ~id
  ~name
  () : category =
  {
    id = id;
    name = name;
  }
let create_user 
  ~name
  ~id
  ?category
  ?category_list
  () : user =
  {
    name = name;
    id = id;
    category = category;
    category_list = category_list;
  }
let create_tag 
  ~id
  ~name
  ?type'
  ?offset
  ?length
  () : tag =
  {
    id = id;
    name = name;
    type' = type';
    offset = offset;
    length = length;
  }
let create_privacy 
  ~value
  () : privacy =
  {
    value = value;
  }
let create_property 
  ~name
  ~text
  ?href
  () : property =
  {
    name = name;
    text = text;
    href = href;
  }
let create_shares 
  ~count
  () : shares =
  {
    count = count;
  }
let create_location 
  ~street
  ?city
  ?state
  ?country
  ~zip
  ~latitude
  ~longitude
  () : location =
  {
    street = street;
    city = city;
    state = state;
    country = country;
    zip = zip;
    latitude = latitude;
    longitude = longitude;
  }
let create_place 
  ~id
  ~name
  ~location
  () : place =
  {
    id = id;
    name = name;
    location = location;
  }
let create_to' 
  ~data
  () : to' =
  {
    data = data;
  }
let create_cursors 
  ?after
  ?before
  () : cursors =
  {
    after = after;
    before = before;
  }
let create_paging 
  ?cursors
  ?next
  ?previous
  () : paging =
  {
    cursors = cursors;
    next = next;
    previous = previous;
  }
let create_likes 
  ~data
  ~paging
  () : likes =
  {
    data = data;
    paging = paging;
  }
let create_comment 
  ~id
  ~from
  ~message
  ~can_remove
  ~created_time
  ~like_count
  ~user_likes
  ?message_tags
  () : comment =
  {
    id = id;
    from = from;
    message = message;
    can_remove = can_remove;
    created_time = created_time;
    like_count = like_count;
    user_likes = user_likes;
    message_tags = message_tags;
  }
let create_comments 
  ~data
  ~paging
  () : comments =
  {
    data = data;
    paging = paging;
  }
let create_with_tags 
  ~data
  () : with_tags =
  {
    data = data;
  }
let create_post 
  ~id
  ?actions
  ?application
  ?caption
  ?comments
  ~created_time
  ?description
  ~from
  ?icon
  ?is_hidden
  ?likes
  ?link
  ?message
  ?message_tags
  ?name
  ?object_id
  ?picture
  ?place
  ~privacy
  ?properties
  ?shares
  ?source
  ?status_type
  ?story
  ?story_tags
  ?to'
  ~type'
  ~updated_time
  ?with_tags
  () : post =
  {
    id = id;
    actions = actions;
    application = application;
    caption = caption;
    comments = comments;
    created_time = created_time;
    description = description;
    from = from;
    icon = icon;
    is_hidden = is_hidden;
    likes = likes;
    link = link;
    message = message;
    message_tags = message_tags;
    name = name;
    object_id = object_id;
    picture = picture;
    place = place;
    privacy = privacy;
    properties = properties;
    shares = shares;
    source = source;
    status_type = status_type;
    story = story;
    story_tags = story_tags;
    to' = to';
    type' = type';
    updated_time = updated_time;
    with_tags = with_tags;
  }
let create_response 
  ~data
  ?paging
  () : response =
  {
    data = data;
    paging = paging;
  }

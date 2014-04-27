print_endline "Enter your API token:"
let token = read_line ()
  
module API = Api.S(Request_cohttp.S)
module R = Core.Result
open Lwt
open Printf

let print_friend f =
  let open Endpoints.User in
  printf "ID: %s\nName: %s\nGender: %s\nName format: %s\nLocale: %s\n\n"
  f.id
  f.name
  (match f.gender with | Some g -> g | None -> "")
  (match f.name_format with | Some nf -> nf | None -> "")
  (match f.locale with | Some l -> l | None -> "");
  flush_all ()
  (*id                 : string;
  bio                : string option;
  birthday           : Common.calendar_us_date option;
  email              : string option;
  first_name         : string option;
  gender             : string option; The gender pronoun selected by this person. This is omitted if that pronoun is a custom value.
  last_name          : string option;
  link               : Common.uri option;  A link to the person's profile.
  locale             : string option; "The person's locale."
  name               : string; "The person's full name"
  name_format        : string option; "The person's name formatted to correctly handle Chinese, Japanese, Korean ordering"
  username           : string option;
  website            : Common.uri option;*)

let print_error error = 
  match error with
  | `Conversion_error e ->
    let buf = Buffer.create 0 in
    Meta_conv.Error.format Tiny_json.Json.format (Format.formatter_of_buffer buf) e; 
    printf "Conversion error:\n%s\n" (Buffer.contents buf);
    Buffer.reset buf
  | `Exception e -> 
    printf "Exception"
  | `Unexpected_response (expected, actual, reason) ->
    printf "Unexpected response:\nActual - %i\nExpected - %i\nReason - %s\n)" expected actual reason
  | _ -> 
    printf "Unknown error\n"

let () = 
  let open Endpoints.User in
  let open Endpoints.User.Friends.ReadResponse in
  let request = token |> Auth.Token.of_string |> Request_cohttp.S.create in
  let rec format_response = function
    | R.Error e -> 
      print_error e;
      return_unit
    | R.Ok paged ->
      API.(paged.response.data)
      |> Lwt_list.map_s (fun friend ->
        return friend.id) >>=
      Lwt_list.map_p (fun id ->
        API.User.read ~user_id:id request >>= (fun r ->
          match r with
          | R.Ok f ->
            print_friend f;
            return_unit
          | R.Error e -> print_error e; 
           return_unit)) >>= (fun _ -> match API.(paged.next) with
      | Some next -> 
        printf "Fetching the next page\n";
        next () >>= format_response
      | None ->
        printf "There are no more pages\n";
        return_unit) 
      
  in
  Lwt.bind (API.User.Friends.read request) format_response |> Lwt_main.run

(*
  A very trivial example showing use of the API.
  Fetches a list of contacts and prints them to the console.
  You must already have created an access token which
  the application will ask for when you execute it.
 *)

print_endline "Enter your API access token:"
let token = read_line ()
  
module API = Api.S(Request_cohttp.S)
module Endpoints = Sociaml_facebook_api_endpoints
module R = Core_kernel.Result

open Lwt
open Printf

let print_friend f =
  let open Endpoints.User in
  printf "Name: %s (ID: %s)\n" f.name f.id

let print_error error = 
  match error with
  | `Conversion_error e ->
    let buf = Buffer.create 0 in
    Meta_conv.Error.format Tiny_json.Json.format (Format.formatter_of_buffer buf) e; 
    printf "Conversion error:\n%s\n" (Buffer.contents buf);
    Buffer.reset buf
  | `Exception e -> 
    eprintf "Exception"
  | `Unexpected_response (expected, actual, reason) ->
    eprintf "Unexpected response:\nActual - %i\nExpected - %i\nReason - %s\n" 
        expected actual reason
  | _ -> 
    eprintf "Unknown error\n"

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
        print_friend friend;
        return_unit) >>= (fun _ -> match API.(paged.next) with
      | Some next -> 
        printf "Fetching the next page\n";
        flush_all ();
        next () >>= format_response
      | None ->
        printf "There are no more pages\n";
        flush_all ();
        return_unit)  
  in
  Lwt.bind (API.User.Friends.read request) format_response |> Lwt_main.run

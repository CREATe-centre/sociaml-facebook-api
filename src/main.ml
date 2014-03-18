open Core.Result
open Types.Post
module A = Api.S(Request_cohttp.S)
open A
open Types.Home_stream
open Printf

let request = Request_cohttp.S.create      
      ("CAAVF4j8uJYABAEi9EEu8STBIsx5VdWS6SZBTdIcyAfoTdhuNgdUhKWZCAI8toSxzq77pnz9EwHYF3aLQZBkhuLJXtPv29f9ZAFCidsHakOysTPwjZBzVNrP21ZBPFvjhOrCIvxXDrPr7QoIA95ZA3oZCVUfqGgju4EiFtAWCtb6OAKm7cHzfKzMu60JT72mTIvIZD" |> Auth.Token.of_string)

let rec go = function
  | Error (`Conversion_error e) ->
    let buf = Buffer.create 0 in
    Meta_conv.Error.format Tiny_json.Json.format (Format.formatter_of_buffer buf) e; 
    Printf.printf "Error parsing configuration:\n%s" (Buffer.contents buf);
    Buffer.reset buf;
    Lwt.return_unit
  | Error _ -> 
    print_endline "Error";
    Lwt.return_unit
  | Ok paged -> 
    (let count = List.length paged.response.data in
    printf "Found %i messages\n" count;
    match paged.next with
    | Some f -> 
      print_endline "Has more messages";
      Lwt.bind (f ()) go
    | None -> 
      print_endline "No more messages";
      Lwt.return_unit) 
in
    

Lwt.bind (A.get_home_stream request) go |> Lwt_main.run
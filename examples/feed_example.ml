print_endline "Enter your API token:"
let token = read_line ()
  
module API = Api.S(Request_cohttp.S)
module R = Core.Result

let () = 
  let open Types.User.Home.ReadResponse in
  let open Types.User.Home.Post in
  let open Types.User.Home.Profile in
  let request = token |> Auth.Token.of_string |> Request_cohttp.S.create in
  let rec format_response = function
    | R.Error (`Conversion_error e) ->
      let buf = Buffer.create 0 in
      Meta_conv.Error.format Tiny_json.Json.format (Format.formatter_of_buffer buf) e; 
      Printf.printf "Error parsing response:\n%s\n" (Buffer.contents buf);
      Buffer.reset buf;
      Lwt.return_unit
    | R.Error _ -> 
      print_endline "An unspecified error occurred.";
      Lwt.return_unit
    | R.Ok paged -> 
      (API.(paged.response.data) |> List.iter (fun post ->
        let msg = match post.message with | Some s -> s | None -> "No message text" in 
        Printf.printf "Message from: %s\n%s\n\n\n" post.from.name msg);
      
      match API.(paged.next) with
      | Some f -> 
        print_endline "Fetching the next set of messages";
        Lwt.bind (f ()) format_response
      | None -> 
        print_endline "There are no more messages";
        Lwt.return_unit) 
  in
  Lwt.bind (API.User.Home.read request) format_response |> Lwt_main.run

module S = struct
  
  open Core.Result
  open Lwt
  open Tiny_json
  
  let graph_api_version = "1.0"
  
  let endpoint = Printf.sprintf "https://graph.facebook.com/v%s" graph_api_version
  
  type t = {
    uri : Uri.t
  }
    
  let create access_token = { 
    uri = Uri.add_query_param' (Uri.of_string endpoint) 
      ("access_token", Auth.Token.to_string access_token);
    }
     
  let parse_response converter data =
    let open Request.Error in
    let open Core.Result in
    try
      Json.parse data |> fun parsed ->
        match converter ?trace:None parsed with
        | `Ok v -> Ok v
        | `Error e -> Error (`Conversion_error e)
        | _ -> Error (`Exception (Pervasives.exit 1)) 
    with e -> Error (`Exception e)
    
  let do_request_by_uri
      t
      uri
      ?expect:(expect=200)
      ?method':(meth=Cohttp.Code.(`GET))
      converter =
    let module Body = Cohttp_lwt_body in
    let module Client = Cohttp_lwt_unix.Client in
    let module Code = Cohttp.Code in
    let module Response = Client.Response in
    uri
    |> (match meth with
    | `GET -> (fun u -> Client.get u)
    | `POST -> (fun u -> Client.post u)
    | _ -> raise (Exit)) 
    >>= fun (resp, body) -> (match Response.status resp with
    | `Code c -> c
    | c -> Code.code_of_status c) |> function
      | c when c = expect -> Body.to_string body >>=
        (fun b -> parse_response converter b |> return)
      | c -> Error (`Unexpected_response
        (expect, c, Code.reason_phrase_of_code c)) |> return
    
  let do_request ?parameters:(parameters=[]) t path  = 
    Uri.add_query_params' (Uri.with_path t.uri path) parameters
    |> do_request_by_uri t
  
end

module Client_id = struct
  type t = string
  let to_string s = s
  let of_string s = s
end


module Client_secret = struct
  type t = string
  let to_string s = s
  let of_string s = s
end


module Token = struct
  type t = string
  let to_string s = s
  let of_string s = s
end


let oauth_dialog_uri = Uri.of_string "https://www.facebook.com/dialog/oauth"

let default_redirect_uri = Uri.of_string "https://www.facebook.com/connect/login_success.html"

let access_token_uri = Uri.of_string "https://graph.facebook.com/oauth/access_token"

let (&) f x = f x

let authorize_uri 
    ?redirect_uri:(redirect_uri=default_redirect_uri)
    ?state
    ?permissions
    ?response_type:(response_type="code")
    client_id =
  (((Uri.add_query_param' oauth_dialog_uri ("client_id", client_id)
  |> Uri.add_query_param' & ("response_type", response_type)) 
  |> Uri.add_query_param' & ("redirect_uri", Uri.to_string redirect_uri))
  |> Uri.add_query_param' & ("state", match state with | Some s -> s | None -> ""))
  |> Uri.add_query_param' & ("scope", match permissions with
    | Some ps -> Util.List.implode "," ps
    | None -> "")

let access_token_uri 
    ?redirect_uri:(redirect_uri=default_redirect_uri)
    client_id
    client_secret
    code =
  (((Uri.add_query_param' access_token_uri ("client_id", client_id)
  |> Uri.add_query_param' & ("client_secret", client_secret))
  |> Uri.add_query_param' & ("code", code))
  |> Uri.add_query_param' & ("redirect_uri", Uri.to_string redirect_uri))

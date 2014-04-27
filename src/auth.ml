module Client_ID = struct
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

let authorize_uri ?redirect_uri:(redirect_uri=default_redirect_uri) ?state ?permissions client_id =
  let ($) x f = f x in 
  let (&) f x = f x in
  ((Uri.add_query_param' oauth_dialog_uri ("client_id", client_id)
  $ Uri.add_query_param' & ("redirect_uri", Uri.to_string redirect_uri))
  $ Uri.add_query_param' & ("state", match state with | Some s -> s | None -> ""))
  $ Uri.add_query_param' & ("permissions", match permissions with
    | Some ps -> ps |> Util.List.implode ~sep:","
    | None -> "")

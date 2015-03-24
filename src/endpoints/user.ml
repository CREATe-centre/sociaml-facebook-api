open Meta_conv.Open
open Tiny_json

type t = {
  id : Common.id;
  bio : string mc_option;
  birthday : Common.calendar_us_date mc_option;
  email : string mc_option;
  first_name : string mc_option;
  gender : string mc_option;
  is_verified : bool mc_option;
  last_name : string mc_option;
  link : Common.uri mc_option;
  locale : string mc_option;
  name : string;
  name_format : string mc_option;
  third_party_id : Common.id mc_option;
  username : string mc_option;
  verified : bool mc_option;
  website : Common.uri mc_option;
} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]


module Home = struct
	
	let read_permissions = [ "read_stream"; ]
	
	
	module Action = struct
		type t = {
			name : string;
			link : Common.uri;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
	
	
	module Application = struct
		type t = {
			id : Common.id;
			name : string;
			namespace : string mc_option;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
	
	
	module Category = struct
		type t = {
			id						 : Common.id;
			name					 : string;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
	
	
	module Profile = struct
    type t = {
      id : Common.id;
      name : string;
      category : string mc_option;
			category_list : Category.t list mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
  end
	
	
	module MessageTagType = struct
		type t =
			| Page [@conv.as "page"]
			| User [@conv.as "user"]
			| Group [@conv.as "group"]
      | Application [@conv.as "application"]
		[@@deriving conv{json}]
	end
	
	
	module MessageTag = struct
		type t = {
			id : Common.id;
			name : string;
			type' [@conv.as "type"] : MessageTagType.t mc_option;
			offset : int;
			length : int;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
	
	
	module MessageTagMap = struct
		
		type t = (int * MessageTag.t) list
		
		let t_of_json ?trace:(trace=[]) j =
  		let err type' = 
    		let msg = Printf.sprintf "Expected object, found %s" type' in
    		`Error (`Primitive_decoding_failure msg, j, trace)
			in
			match j with 
			  | Json.String s -> err "string"
			  | Json.Number _ -> err "number"
			  | Json.Array _ -> err "array"
			  | Json.Bool _ -> err "bool"
			  | Json.Null -> err "null"
			  | Json.Object o -> 
					Meta_conv.Result.map (fun (k, v) ->
						let k' = int_of_string k in
						let v' = v |> Json.as_list |> List.hd |> MessageTag.t_of_json ~trace:trace in
						match v' with 
						| `Ok v'' -> `Ok (k', v'')
						| `Error e -> `Error e) o

    let t_of_json_exn ?trace j = 
      match t_of_json ?trace j with
      | `Ok t -> t
      | `Error e -> raise (Common.Meta_conv_error e)

    let json_of_t t = 
      Json.Object(t |> List.map (fun (k,v) -> string_of_int k, MessageTag.json_of_t v))
		
	end
	
	
	module Comment = struct
		type t = {
			id : Common.id;
			from : Profile.t mc_option;
			message : string;
			can_remove : bool;
			created_time : Common.calendar_iso8601;
			like_count : int;
			message_tags : MessageTag.t list mc_option;
			user_likes : bool;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
		
		
  module Comments 
		: Common.PagedResponse with type data = Comment.t
		= struct
			
	  type data = Comment.t [@@deriving conv{json}]
		
		type cursors = {
   		after : string;
			before : string;
  	} [@@conv.ignore_unknown_fields][@@deriving conv{json}]
      
    type page_navigation = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
			cursors : cursors mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
    type t = { 
      data : data list; 
      paging : page_navigation mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
			
	end
	
	
	module Properties = struct
		type t = {
			name : string mc_option;
			text : string;
			href : Common.uri mc_option;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
	
	
	module Shares = struct
		type t = {
			count : int;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
	
	
	module StatusType = struct
		type t = 
			| Mobile_status_update [@conv.as "mobile_status_update"]
			| Created_note [@conv.as "created_note"]
			| Added_photos [@conv.as "added_photos"]
			| Added_video [@conv.as "added_video"]
			| Shared_story [@conv.as "shared_story"]
			| Created_group [@conv.as "created_group"]
			| Created_event [@conv.as "created_event"]
			| Wall_post [@conv.as "wall_post"]
			| App_created_story [@conv.as "app_created_story"]
			| Published_story [@conv.as "published_story"]
			| Tagged_in_photo [@conv.as "tagged_in_photo"]
			| Approved_friend [@conv.as "approved_friend"]
			[@@deriving conv{json}]
	end
	
	
	module Likes 
		: Common.PagedResponse with type data = Profile.t
		= struct
			
		type data = Profile.t [@@deriving conv{json}]
		
		type cursors = {
   		after : string;
			before : string;
  	} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
      
    type page_navigation = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
			cursors : cursors mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
    type t = { 
      data : data list; 
      paging : page_navigation mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
			
	end
	
	
	module To 
		: Common.PagedResponse with type data = Profile.t
		= struct
			
		type data = Profile.t [@@deriving conv{json}]
		
		type cursors = {
   		after : string;
			before : string;
  	} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
      
    type page_navigation = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
			cursors : cursors mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
    type t = { 
      data : data list; 
      paging : page_navigation mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
			
	end
  
	
	module Type = struct
		type t = 
			| Link [@conv.as "link"]
			| Status [@conv.as "status"]
			| Photo [@conv.as "photo"]
			| Video [@conv.as "video"] 
			| Swf [@conv.as "swf"]
      | Event [@conv.as "event"]
			[@@deriving conv{json}]
	end
	
	
	module Privacy = struct
		
		type group = 
			| Everyone [@conv.as "EVERYONE"]
			| All_friends [@conv.as "ALL_FRIENDS"]
			| Friends_of_friends [@conv.as "FRIENDS_OF_FRIENDS"]
			| Self [@conv.as "SELF"]
			| Custom [@conv.as "CUSTOM"]
			| Unknown [@conv.as ""]
			[@@deriving conv{json}]

		type friend_group =
			| All_friends [@conv.as "ALL_FRIENDS"]
			| Friends_of_friends [@conv.as "FRIENDS_OF_FRIENDS"]
			| Some_friends [@conv.as "SOME_FRIENDS"]
			| Unknown [@conv.as ""]
			[@@deriving conv{json}]
		
		type t = {
			description : string mc_option;
			value : group;
			friends : friend_group mc_option;
			networks : string mc_option;
			allow : Common.csv mc_option;
			deny : Common.csv mc_option;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
		
	end
	
	
	module Location = struct
    
    module StructuredLocation = struct
  		type t = {
  			country : string mc_option;
  			city : string mc_option;
  			longitude : float;
  			zip : string mc_option;
  			state : string mc_option;
  			street : string mc_option;
  			located_in : Common.id mc_option;
  			latitude : float;
  		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    end
    
    type t =
      | Simple of string
      | Structured of StructuredLocation.t
    
    let t_of_json ?trace = function  
      | Json.String s -> `Ok (Simple (s))
      | Json.Number n -> `Ok (Simple (n))
      | Json.Array _ -> `Ok (Simple (""))
      | Json.Bool b -> `Ok (Simple (string_of_bool b))
      | Json.Null -> `Ok (Simple (""))
      | o -> (match StructuredLocation.t_of_json ?trace o with
        | `Ok t -> `Ok( Structured (t))
        | `Error e -> `Error e)  
    
    let t_of_json_exn ?trace = function  
      | Json.String s -> Simple (s)
      | Json.Number n -> Simple (n)
      | Json.Array _ -> Simple ("")
      | Json.Bool b -> Simple (string_of_bool b)
      | Json.Null -> Simple ("")
      | o -> Structured (StructuredLocation.t_of_json_exn ?trace o)
    
    let json_of_t = function
      | Simple l -> Json.String(l)
      | Structured l -> (StructuredLocation.json_of_t l)
    
	end
	
	
	module Page = struct
		type t = {
			id : Common.id;
			name : string;
			location : Location.t mc_option;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
	
  
  module Post = struct
    type t = {
			actions : Action.t list mc_option;
			application : Application.t mc_option;
			caption : string mc_option;
			comments : Comments.t mc_option;
      created_time : Common.calendar_iso8601;
			description : string mc_option;
      from : Profile.t;
			height : int mc_option;
			icon : Common.uri mc_option;
      id : Common.id;
			is_hidden : bool mc_option;
			likes : Likes.t mc_option;
			link : Common.uri mc_option;
      message : string mc_option;
			message_tags : MessageTagMap.t mc_option;
			name : string mc_option;
	    object_id : Common.id mc_option;
	    picture : Common.uri mc_option;
			place : Page.t mc_option;
			privacy : Privacy.t;
			properties : Properties.t list mc_option;
			shares : Shares.t mc_option;
			source : Common.uri mc_option;
			status_type : StatusType.t mc_option;
			story : string mc_option;
			story_tags : MessageTagMap.t mc_option;
			to' [@conv.as "to"] : To.t mc_option;
			type' [@conv.as "type"] : Type.t;
      updated_time : Common.calendar_iso8601;
			width : int mc_option;
			with_tags : To.t mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
  end
  
  
  module ReadResponse
    : Common.PagedResponse with type data = Post.t 
    = struct
    
    type data = Post.t [@@deriving conv{json}]
		
		type cursors = {
   		after : string;
			before : string;
  	} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
      
    type page_navigation = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
			cursors : cursors mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
    type t = { 
      data : data list; 
      paging : page_navigation mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
  end

end


module Feed = struct
	
	let read_permissions = [ "read_stream"; ]
	
	let publish_permissions = [ "publish_actions"; ]
  
  
  module ReadResponse
    : Common.PagedResponse with type data = Home.Post.t 
    = struct
    
    type data = Home.Post.t [@@deriving conv{json}]
        
    type cursors = {
      after : string;
      before : string;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
      
    type page_navigation = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
            cursors : cursors mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
    type t = { 
      data : data list; 
      paging : page_navigation mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
  end
	
	
	module PublishRequest = struct
		type t = {
			message	: string;
		}		
	end
	
	
	module PublishResponse = struct
		type t = {
			id	: Common.id;
		} [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
	end
	
end


module Posts = struct
    
  let read_permissions = [ "read_stream"; ]
  
  
  module ReadResponse
    : Common.PagedResponse with type data = Home.Post.t 
    = struct
    
    type data = Home.Post.t [@@deriving conv{json}]
        
    type cursors = {
      after : string;
      before : string;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
      
    type page_navigation = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
            cursors : cursors mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
    type t = { 
      data : data list; 
      paging : page_navigation mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
  end
    
end


module Friends = struct
  
  let read_permissions = [ "user_friends" ]
  
  
  module ReadResponse
      : Common.PagedResponse with type data = t 
      = struct
    
    type data = t [@@deriving conv{json}]
    
    type cursors = {
      after : string;
      before : string;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
      
    type page_navigation = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
      cursors : cursors mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
    type t = { 
      data : data list; 
      paging : page_navigation mc_option;
    } [@@conv.ignore_unknown_fields] [@@deriving conv{json}]
    
  end
  
end

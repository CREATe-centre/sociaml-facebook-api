open Meta_conv.Open
open Json_conv
open Tiny_json

type t (: Ignore_unknown_fields :) = {
  id : string;
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
  third_party_id : string mc_option;
  username : string mc_option;
  verified : bool mc_option;
  website : Common.uri mc_option;
} with conv(json)


module Home = struct
	
	let read_permissions = [ "read_stream"; ]
	
	
	module Action = struct
		type t (: Ignore_unknown_fields :) = {
			name : string;
			link : Common.uri;
		} with conv(json)
	end
	
	
	module Application = struct
		type t (: Ignore_unknown_fields :) = {
			id : string;
			name : string;
			namespace : string mc_option;
		} with conv(json)
	end
	
	
	module Category = struct
		type t (: Ignore_unknown_fields :) = {
			id						 : string;
			name					 : string;
		} with conv(json)
	end
	
	
	module Profile = struct
    type t (: Ignore_unknown_fields :) = {
      id : string;
      name : string;
      category : string mc_option;
			category_list : Category.t list mc_option;
    } with conv(json)
  end
	
	
	module MessageTagType = struct
		type t =
			| Page as "page"
			| User as "user"
			| Group as "group"
      | Application as "application"
		with conv(json)
	end
	
	
	module MessageTag = struct
		type t (: Ignore_unknown_fields :) = {
			id : string;
			name : string;
			type' as "type" : MessageTagType.t mc_option;
			offset : int;
			length : int;
		} with conv(json)
	end
	
	
	module MessageTagMap = struct
		
		type t = (int * MessageTag.t) list
		
		let t_of_json ?trace:(trace=[]) j =
  		let err type' = 
    		let msg = Printf.sprintf "Expected object, found %s" type' in
    		`Error (Meta_conv.Error.Primitive_decoding_failure msg, j, trace)
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
		type t (: Ignore_unknown_fields :) = {
			id : string;
			from : Profile.t;
			message : string;
			can_remove : bool;
			created_time : Common.calendar_iso8601;
			like_count : int;
			message_tags : MessageTag.t list mc_option;
			user_likes : bool;
		} with conv(json)
	end
		
		
  module Comments 
		: Common.PagedResponse with type data = Comment.t
		= struct
			
	  type data = Comment.t with conv(json)
		
		type cursors (: Ignore_unknown_fields :) = {
   		after : string;
			before : string;
  	} with conv(json)
      
    type page_navigation (: Ignore_unknown_fields :) = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
			cursors : cursors mc_option;
    } with conv(json)
    
    type t (: Ignore_unknown_fields :) = { 
      data : data list; 
      paging : page_navigation mc_option;
    } with conv(json)
			
	end
	
	
	module Properties = struct
		type t (: Ignore_unknown_fields :) = {
			name : string mc_option;
			text : string;
			href : Common.uri mc_option;
		} with conv(json)
	end
	
	
	module Shares = struct
		type t (: Ignore_unknown_fields :) = {
			count : int;
		} with conv(json)
	end
	
	
	module StatusType = struct
		type t = 
			| Mobile_status_update as "mobile_status_update"
			| Created_note as "created_note"
			| Added_photos as "added_photos"
			| Added_video as "added_video"
			| Shared_story as "shared_story"
			| Created_group as "created_group"
			| Created_event as "created_event"
			| Wall_post as "wall_post"
			| App_created_story as "app_created_story"
			| Published_story as "published_story"
			| Tagged_in_photo as "tagged_in_photo"
			| Approved_friend as "approved_friend"
			with conv(json)
	end
	
	
	module Likes 
		: Common.PagedResponse with type data = Profile.t
		= struct
			
		type data = Profile.t with conv(json)
		
		type cursors (: Ignore_unknown_fields :) = {
   		after : string;
			before : string;
  	} with conv(json)
      
    type page_navigation (: Ignore_unknown_fields :) = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
			cursors : cursors mc_option;
    } with conv(json)
    
    type t (: Ignore_unknown_fields :) = { 
      data : data list; 
      paging : page_navigation mc_option;
    } with conv(json)
			
	end
	
	
	module To 
		: Common.PagedResponse with type data = Profile.t
		= struct
			
		type data = Profile.t with conv(json)
		
		type cursors (: Ignore_unknown_fields :) = {
   		after : string;
			before : string;
  	} with conv(json)
      
    type page_navigation (: Ignore_unknown_fields :) = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
			cursors : cursors mc_option;
    } with conv(json)
    
    type t (: Ignore_unknown_fields :) = { 
      data : data list; 
      paging : page_navigation mc_option;
    } with conv(json)
			
	end
  
	
	module Type = struct
		type t = 
			| Link as "link"
			| Status as "status"
			| Photo as "photo"
			| Video as "video" 
			| Swf as "swf"
			with conv(json)
	end
	
	
	module Privacy = struct
		
		type group = 
			| Everyone as "EVERYONE"
			| All_friends as "ALL_FRIENDS"
			| Friends_of_friends as "FRIENDS_OF_FRIENDS"
			| Self as "SELF"
			| Custom as "CUSTOM"
			| Unknown as ""
			with conv(json)

		type friend_group =
			| All_friends as "ALL_FRIENDS"
			| Friends_of_friends as "FRIENDS_OF_FRIENDS"
			| Some_friends as "SOME_FRIENDS"
			| Unknown as ""
			with conv(json)
		
		type t (: Ignore_unknown_fields :) = {
			description : string mc_option;
			value : group;
			friends : friend_group mc_option;
			networks : string mc_option;
			allow : Common.csv mc_option;
			deny : Common.csv mc_option;
		} with conv(json)
		
	end
	
	
	module Location = struct
		type t (: Ignore_unknown_fields :) = {
			country : string mc_option;
			city : string mc_option;
			longitude : float;
			zip : string mc_option;
			state : string mc_option;
			street : string mc_option;
			located_in : string mc_option;
			latitude : float;
		} with conv(json)
	end
	
	
	module Page = struct
		type t (: Ignore_unknown_fields :) = {
			id : string;
			name : string;
			location : Location.t mc_option;
		} with conv(json)
	end
	
  
  module Post = struct
    type t (: Ignore_unknown_fields :) = {
			actions : Action.t list mc_option;
			application : Application.t mc_option;
			caption : string mc_option;
			comments : Comments.t mc_option;
      created_time : Common.calendar_iso8601;
			description : string mc_option;
      from : Profile.t;
			height : int mc_option;
			icon : Common.uri mc_option;
      id : string;
			is_hidden : bool mc_option;
			likes : Likes.t mc_option;
			link : Common.uri mc_option;
      message : string mc_option;
			message_tags : MessageTagMap.t mc_option;
			name : string mc_option;
	    object_id : string mc_option;
	    picture : Common.uri mc_option;
			place : Page.t mc_option;
			privacy : Privacy.t;
			properties : Properties.t list mc_option;
			shares : Shares.t mc_option;
			source : Common.uri mc_option;
			status_type : StatusType.t mc_option;
			story : string mc_option;
			story_tags : MessageTagMap.t mc_option;
			to' as "to" : To.t mc_option;
			type' as "type" : Type.t;
      updated_time : Common.calendar_iso8601;
			width : int mc_option;
			with_tags : To.t mc_option;
    } with conv(json)
  end
  
  
  module ReadResponse
    : Common.PagedResponse with type data = Post.t 
    = struct
    
    type data = Post.t with conv(json)
		
		type cursors (: Ignore_unknown_fields :) = {
   		after : string;
			before : string;
  	} with conv(json)
      
    type page_navigation (: Ignore_unknown_fields :) = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
			cursors : cursors mc_option;
    } with conv(json)
    
    type t (: Ignore_unknown_fields :) = { 
      data : data list; 
      paging : page_navigation mc_option;
    } with conv(json)
    
  end

end


module Feed = struct
	
	let read_permissions = [ "read_stream"; ]
	
	let publish_permissions = [ "publish_actions"; ]
  
  
  module ReadResponse
    : Common.PagedResponse with type data = Home.Post.t 
    = struct
    
    type data = Home.Post.t with conv(json)
        
    type cursors (: Ignore_unknown_fields :) = {
      after : string;
      before : string;
    } with conv(json)
      
    type page_navigation (: Ignore_unknown_fields :) = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
            cursors : cursors mc_option;
    } with conv(json)
    
    type t (: Ignore_unknown_fields :) = { 
      data : data list; 
      paging : page_navigation mc_option;
    } with conv(json)
    
  end
	
	
	module PublishRequest = struct
		type t = {
			message	: string;
		}		
	end
	
	
	module PublishResponse = struct
		type t (: Ignore_unknown_fields :) = {
			id	: string;
		} with conv(json)
	end
	
end


module Posts = struct
    
  let read_permissions = [ "read_stream"; ]
  
  
  module ReadResponse
    : Common.PagedResponse with type data = Home.Post.t 
    = struct
    
    type data = Home.Post.t with conv(json)
        
    type cursors (: Ignore_unknown_fields :) = {
      after : string;
      before : string;
    } with conv(json)
      
    type page_navigation (: Ignore_unknown_fields :) = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
            cursors : cursors mc_option;
    } with conv(json)
    
    type t (: Ignore_unknown_fields :) = { 
      data : data list; 
      paging : page_navigation mc_option;
    } with conv(json)
    
  end
    
end


module Friends = struct
  
  let read_permissions = [ "user_friends" ]
  
  
  module ReadResponse
      : Common.PagedResponse with type data = t 
      = struct
    
    type data = t with conv(json)
    
    type cursors (: Ignore_unknown_fields :) = {
      after : string;
      before : string;
    } with conv(json)
      
    type page_navigation (: Ignore_unknown_fields :) = {
      next : Common.uri mc_option;
      previous : Common.uri mc_option;
      cursors : cursors mc_option;
    } with conv(json)
    
    type t (: Ignore_unknown_fields :) = { 
      data : data list; 
      paging : page_navigation mc_option;
    } with conv(json)
    
  end
  
end

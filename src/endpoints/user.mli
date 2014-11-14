open Meta_conv.Open
open Json_conv
open Tiny_json

type t = {
  id                 : string;
  bio                : string option;
  birthday           : Common.calendar_us_date option;
  email              : string option;
  first_name         : string option;
  gender             : string option;
  is_verified        : bool option;
  last_name          : string option;
  link               : Common.uri option;
  locale             : string option;
  name               : string;
  name_format        : string option;
  third_party_id     : string option;
  username           : string option;
  verified           : bool option;
  website            : Common.uri option;
} with conv(json)

module Home : sig
	
	val read_permissions : string list
	
	
	module Action : sig
		type t = {
			name					 : string;
			link					 : Common.uri;
		} with conv(json)
	end
	
	
	module Application : sig
		type t = {
			id						 : string;
			name					 : string;
			namespace			 : string option;
		} with conv(json)
	end
	
	
	module Category : sig
		type t = {
			id						 : string;
			name					 : string;
		} with conv(json)
	end
	
	
	module Profile : sig
	  type t = {
	    id             : string;
	    name           : string;
	    category       : string option;
			category_list  : Category.t list option;
	  } with conv(json)
	end
	
	
	module MessageTagType : sig
		type t =
			| Page
			| User
			| Group
      | Application
    with conv(json)
	end
	
	
	module MessageTag : sig
		type t = {
			id             : string;
			name           : string;
			type'          : MessageTagType.t option;
			offset         : int;
			length         : int;
		} with conv(json)
	end
	
	
	module MessageTagMap : sig
		type t = (int * MessageTag.t) list with conv(json)
	end
	
	
	module Comment : sig
		type t = {
			id             : string;
			from           : Profile.t;
			message        : string;
			can_remove     : bool;
			created_time   : Common.calendar_iso8601;
			like_count     : int;
			message_tags   : MessageTag.t list option;
			user_likes     : bool;
		} with conv(json)
	end
		
		
  module Comments : Common.PagedResponse with type data = Comment.t
		
	
	module Properties : sig
		type t = {
			name					 : string option;
			text					 : string;
			href					 : Common.uri option;
		} with conv(json)
	end
	
	
	module Shares : sig
		type t = {
			count					 : int;
		} with conv(json)
	end
	
	
	module StatusType : sig
		type t = 
			| Mobile_status_update
			| Created_note
			| Added_photos
			| Added_video
			| Shared_story
			| Created_group
			| Created_event
			| Wall_post
			| App_created_story
			| Published_story
			| Tagged_in_photo
			| Approved_friend
    with conv(json)
	end
	
	
	module Likes : Common.PagedResponse with type data = Profile.t
	
	
	module To : Common.PagedResponse with type data = Profile.t
	
	
	module Type : sig
		type t = 
			| Link
			| Status
			| Photo
			| Video
			| Swf
    with conv(json)
	end
	
	
	module Privacy : sig
		
		type group = 
			| Everyone
			| All_friends
			| Friends_of_friends
			| Self
			| Custom
			| Unknown
    with conv(json)

		type friend_group =
			| All_friends
			| Friends_of_friends
			| Some_friends
			| Unknown
    with conv(json)
		
		type t = {
			description		 : string option;
			value          : group;
			friends        : friend_group option;
			networks			 : string option;
			allow          : Common.csv option;
			deny           : Common.csv option;
		} with conv(json)
    
	end
	
	
	module Location : sig
		type t = {
			country				 : string option;
			city					 : string option;
			longitude      : float;
			zip						 : string option;
			state          : string option;
			street         : string option;
			located_in     : string option;
			latitude       : float;
		} with conv(json)
	end
	
	
	module Page : sig
		type t = {
			id						 : string;
			name           : string;
			location			 : Location.t option;
		} with conv(json)
	end
	
	
	module Post : sig
	  
    type t = {
	    actions        : Action.t list option;
	    application    : Application.t option;
	    caption        : string option;
	    comments       : Comments.t option;
	    created_time   : Common.calendar_iso8601;
	    description    : string option;
	    from           : Profile.t;
        height         : int option;
	    icon           : Common.uri option;
	    id             : string;
	    is_hidden      : bool option;
	    likes          : Likes.t option;
	    link           : Common.uri option;
	    message        : string option;
	    message_tags   : MessageTagMap.t option;
	    name           : string option;
	    object_id      : string option;
	    picture        : Common.uri option;
	    place          : Page.t option;
	    privacy        : Privacy.t;
	    properties     : Properties.t list option;
	    shares         : Shares.t option;
	    source         : Common.uri option;
	    status_type    : StatusType.t option;
	    story          : string option;
	    story_tags     : MessageTagMap.t option;
	    to'            : To.t option;
	    type'          : Type.t;
	    updated_time   : Common.calendar_iso8601;
        width          : int option;
	    with_tags      : To.t option;
	  } with conv(json)
    
	end


	module ReadResponse : Common.PagedResponse with type data = Post.t

end


module Feed : sig
	
	val read_permissions : string list
	
	val publish_permissions : string list
    
  
  module ReadResponse : Common.PagedResponse with type data = Home.Post.t
	
	
	module PublishRequest : sig
		type t = {
			message					: string;
		}
	end
	
	
	module PublishResponse : sig
		
		type t = {
			id							: string;
		} with conv(json)
		
	end
	
end


module Posts : sig
    
    val read_permissions : string list
  
  
  module ReadResponse : Common.PagedResponse with type data = Home.Post.t
    
end


module Friends : sig
  
  val read_permissions : string list
  
  
  module ReadResponse : Common.PagedResponse with type data = t
  
end

module S (Req : Request.S) : sig
  
  type ('a, 'b) paged = {
    response : 'a;
    next : (unit -> (('a, 'b) paged, 'b) Request.response) option;
    previous : (unit -> (('a, 'b) paged, 'b) Request.response) option;
  }
	
	
	module User : sig
    
    val read : 
      ?user_id : string
      -> Req.t
      -> (Sociaml_facebook_api_endpoints.User.t, 
        [> | Tiny_json.Json.t Request.Error.t ]) Request.response
    
    module Home : sig
			
			val read : 
        ?user_id : string  
        -> ?since : int
        -> ?until : int
        -> ?limit : int
        -> Req.t
        -> ((Sociaml_facebook_api_endpoints.User.Home.ReadResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ] as 'a) paged, 'a) Request.response
		
		end
		
		
		module Feed : sig
      
      val read :
        ?user_id : string
        -> ?since : int
        -> ?until : int
        -> ?limit : int
        -> Req.t
        -> ((Sociaml_facebook_api_endpoints.User.Feed.ReadResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ] as 'a) paged, 'a) Request.response
			
			val publish :
				?user_id : string
				-> Sociaml_facebook_api_endpoints.User.Feed.PublishRequest.t
				-> Req.t
				-> (Sociaml_facebook_api_endpoints.User.Feed.PublishResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ]) Request.response
			
		end
    
    
    module Posts : sig
      
      val read :
        ?user_id : string
        -> ?since : int
        -> ?until : int
        -> ?limit : int
        -> Req.t
        -> ((Sociaml_facebook_api_endpoints.User.Posts.ReadResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ] as 'a) paged, 'a) Request.response
            
    end
    
    
    module Friends : sig
      
      val read : 
        ?user_id : string  
        -> ?limit : int
        -> Req.t
        -> ((Sociaml_facebook_api_endpoints.User.Friends.ReadResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ] as 'a) paged, 'a) Request.response
          
    end
		
	end
  
end

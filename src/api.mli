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
      -> (Endpoints.User.t, [> | Tiny_json.Json.t Request.Error.t ]) Request.response
    
    module Home : sig
			
			val read : 
        ?user_id : string  
        -> ?since : int
        -> ?until : int
        -> ?limit : int
        -> Req.t
        -> ((Endpoints.User.Home.ReadResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ] as 'a) paged, 'a) Request.response
		
		end
		
		
		module Feed : sig
			
			val publish :
				?user_id : string
				-> Endpoints.User.Feed.PublishRequest.t
				-> Req.t
				-> (Endpoints.User.Feed.PublishResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ]) Request.response
			
		end
    
    
    module Friends : sig
      
      val read : 
        ?user_id : string  
        -> ?limit : int
        -> Req.t
        -> ((Endpoints.User.Friends.ReadResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ] as 'a) paged, 'a) Request.response
          
    end
		
	end
  
end

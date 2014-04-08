module S (Req : Request.S) : sig
  
  type ('a, 'b) paged = {
    response : 'a;
    next : (unit -> (('a, 'b) paged, 'b) Request.response) option;
    previous : (unit -> (('a, 'b) paged, 'b) Request.response) option;
  }
	
	
	module User : sig
		
        module Home : sig
			
			val read : 
        ?user_id : string  
        -> ?since : int
        -> ?until : int
        -> ?limit : int
        -> Req.t
        -> ((Types.User.Home.ReadResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ] as 'a) paged, 'a) Request.response
		
		end
		
		
		module Feed : sig
			
			val publish :
				?user_id : string
				-> Types.User.Feed.PublishRequest.t
				-> Req.t
				-> (Types.User.Feed.PublishResponse.t, 
          [> | Tiny_json.Json.t Request.Error.t ]) Request.response
			
		end
		
	end
  
end

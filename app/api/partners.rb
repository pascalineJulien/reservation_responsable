module Partners
  class API < Grape::API
    
    content_type :json, 'application/json' 
    default_format :json
    mount Bookings

    # API#home 
    get '/' do
      error_struct!(nil, "no_object" , "You must specify object for partners", 404)
    end
  end
end

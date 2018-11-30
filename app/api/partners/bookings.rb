module Partners 
  class Bookings < Grape::API
    resource :bookings do

      desc "List all AmbassadorAmbassador"

      get do
        Ambassador.all
      end

      
      post "/confirm" do
        BookingService.new.notify_confirmation(params) 
      end
    end
  end
end

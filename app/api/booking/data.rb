module Booking 
  class Data < Grape::API
    resource :booking_data do
        desc "test grape"

      get do
        [] 
      end
    end
  end
end

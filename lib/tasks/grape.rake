require 'awesome_print'

namespace :grape do
  desc "Prints grape routes"
  task :routes => :environment do  

    puts "Partners Routes"
    print_routes(Partners::Bookings.routes)

  end

  def print_routes(routes) 
    routes.each do |r|
      puts "\t#{r}"
    end
  end

end

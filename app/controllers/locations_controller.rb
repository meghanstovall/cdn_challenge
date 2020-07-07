class LocationsController < ApplicationController
  def new
  end

  def create
    user_location = LocationFacade.new(params[:latlong])
    location1 = LocationFacade.new(params[:server1])
    location2 = LocationFacade.new(params[:server2])
    server1 = Location.new({  name: "Server 1",
                              latitude: location1.latitude,
                              longitude: location1.longitude,
                              country: location1.country,
                              state: location1.state })
    server1.save!

    server2 = Location.new({  name: "Server 2",
                              latitude: location2.latitude,
                              longitude: location2.longitude,
                              country: location2.country,
                              state: location2.state })
    server2.save!

    user_location = Location.new({ name: "User's location",
                              latitude: user_location.latitude,
                              longitude: user_location.longitude,
                              state: user_location.state,
                              country: user_location.country })
    user_location.save!

    redirect_to "/results"
  end

  def results
    server1 = Location.find_by(name: "Server 1")
    server2 = Location.find_by(name: "Server 2")
    location = Location.find_by(name: "User's location")

    @results = Result.new(location, server1, server2)
  end
end

class LocationsController < ApplicationController
  def new
  end

  def create
    #create and put three locations in the database
    user_location = LocationFacade.new(params[:latlong])
    location1 = LocationFacade.new(params[:server1])
    location2 = LocationFacade.new(params[:server2])
    server1 = Location.new({  name: location1.state + ", " + location1.country,
                              latitude: location1.latitude,
                              longitude: location1.longitude })
    server1.save!

    server2 = Location.new({  name: location2.state + ", " + location2.country,
                              latitude: location2.latitude,
                              longitude: location2.longitude })
    server2.save!

    user_location = Location.new({ name: user_location.state + ", " + user_location.country,
                              latitude: user_location.latitude,
                              longitude: user_location.longitude })
    user_location.save!

    redirect_to "/results/#{user_location.id}/servers/#{server1.id}/#{server2.id}"
  end

  def results
    # find three locations in database, send results variable to view
    # to call calculation methods that are in the rsult PORO
    server1 = Location.find_by(id: params[:server1_id])
    server2 = Location.find_by(id: params[:server2_id])
    location = Location.find_by(id: params[:user_id])

    @results = Result.new(location, server1, server2)
  end
end

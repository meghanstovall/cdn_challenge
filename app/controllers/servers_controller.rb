class ServersController < ApplicationController
  def new
  end

  def create
    location1 = LocationFacade.new(params[:server1])
    location2 = LocationFacade.new(params[:server2])
    server1 = Location.new({  name: "Server 1",
                              latitude: location1.latitude,
                              longitude: location1.longitude,
                              country: location1.country,
                              state: location1.state })
    server1.save

    server2 = Location.new({  name: "Server 2",
                              latitude: location2.latitude,
                              longitude: location2.longitude,
                              country: location2.country,
                              state: location2.state })
    server2.save

    redirect_to "/results"
  end
end

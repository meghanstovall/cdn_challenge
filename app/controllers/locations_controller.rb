class LocationsController < ApplicationController
  def new
  end

  def create
    user_location = LocationFacade.new(params[:latlong])
    location = Location.new({ name: "User's location",
                              latitude: user_location.latitude,
                              longitude: user_location.longitude,
                              state: user_location.state,
                              country: user_location.country })
    location.save

    redirect_to "/locations/#{location.id}"
  end

  def show
    @location = Location.find(params[:id])
  end
end

class LocationsController < ApplicationController
  def new
  end

  def create
    @user_location = LocationFacade.new(params[:latlong])
    location = Location.new({ latitude: @user_location.latitude,
                              longitude: @user_location.longitude,
                              city: @user_location.city,
                              state: @user_location.state })
    location.save

    redirect_to "/locations/#{location.id}"
  end

  def show
    @location = Location.find(params[:id])
  end
end

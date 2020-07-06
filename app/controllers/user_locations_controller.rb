class UserLocationsController < ApplicationController
  def index
    @locations = UserLocation.all
  end

  def new
  end

  def create
    @user_location = LocationFacade.new(params[:latitude], params[:longitude])
    location = UserLocation.new({ latitude: params[:latitude],
                                  longitude: params[:longitude],
                                  city: @user_location.city,
                                  state: @user_location.state })
    location.save

    redirect_to "/locations"
  end
end

class UserLocationsController < ApplicationController
  def new
  end

  def create
    @user_location = LocationService.location(params[:latitude], params[:longitude])

  end
end

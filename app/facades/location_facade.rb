class LocationFacade

  def initialize(latitude, longitude)
    @location = LocationService.location(latitude, longitude)
  end

  def city
    @location[3][:short_name]
  end

  def state
    @location[5][:short_name]
  end
end

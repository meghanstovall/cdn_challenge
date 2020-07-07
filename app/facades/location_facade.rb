class LocationFacade

  attr_reader :latitude, :longitude

  def initialize(latlong)
    @location = LocationService.location(latlong)
    @latitude = latlong.split(", ")[0]
    @longitude = latlong.split(", ")[-1]
  end

  def city
    @location[3][:short_name]
  end

  def state
    @location[5][:short_name]
  end
end

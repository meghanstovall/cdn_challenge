class LocationFacade

  attr_reader :latitude, :longitude

  def initialize(latlong)
    @location = LocationService.location(latlong)
    @latitude = latlong.split(", ")[0]
    @longitude = latlong.split(", ")[-1]
  end

  def state
    @location[-3][:long_name]
  end

  def country
    @location[-2][:short_name]
  end
end

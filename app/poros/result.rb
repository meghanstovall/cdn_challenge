class Result

  def initialize(location, server1, server2)
    @location = location
    @server1 = server1
    @server2 = server2
  end

  def closest_location
    distance1 = LocationService.distance(@location, @server1)
    distance2 = LocationService.distance(@location, @server2)
    if distance1 < distance2
      @server1.state + ", " + @server1.country
    else
      @server2.state + ", " + @server2.country
    end
  end
end

class Result

  # result PORO where all calculations are made

  def initialize(location, server1, server2)
    @location = location
    @server1 = server1
    @server2 = server2
  end

  def closest_location
    distance1 = LocationService.distance(@location, @server1)
    distance2 = LocationService.distance(@location, @server2)
    if distance1 < distance2
      @server1
    else
      @server2
    end
  end

  def round_trip_time
    server = closest_location
    distance = LocationService.distance(@location, server)
    # twice the distance, divided by 2 times the speed of propagation
    2 * distance / (2 * (10 ** 8)).to_f
  end

  def maximum_bandwidth
    # link capacity - 10MBdelay(10000 kbps)
    # 10MBdelay(10000 kbps) * 10^3bits/sec * rtt * 10^-3 sec
    rtt = round_trip_time
    (10000 * (10 ** 3) * rtt * (10 ** -3)).to_f
  end
end

class LocationService
  def self.location(latlong)
    self.get_json("/maps/api/geocode/json?latlng=#{latlong}&key=#{ENV['GOOGLE_API_KEY']}")[:results][0][:address_components]
  end

  def self.closest_location(location, server1, server2)
    distance1 = self.get_json("/maps/api/distancematrix/json?units=imperial&origins=#{location.state},#{location.country}&destinations=#{server1.state},#{server1.country}&key=#{ENV['GOOGLE_API_KEY']}")[:rows][0][:elements][0][:distance][:text][0...-3].to_i
    distance2 = self.get_json("/maps/api/distancematrix/json?units=imperial&origins=#{location.state},#{location.country}&destinations=#{server2.state},#{server2.country}&key=#{ENV['GOOGLE_API_KEY']}")[:rows][0][:elements][0][:distance][:text][0...-3].to_i
    if distance1 < distance2 then server1 else server2 end
  end

  private
    def self.get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
      Faraday.new(url: "https://maps.googleapis.com")
    end
end

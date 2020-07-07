class LocationService
  def self.location(latlong)
    self.get_json("/maps/api/geocode/json?latlng=#{latlong}&key=#{ENV['GOOGLE_API_KEY']}")[:results][0][:address_components]
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

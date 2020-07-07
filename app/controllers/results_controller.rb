class ResultsController < ApplicationController

  def index
    server1 = Location.find_by(name: "Server 1")
    server2 = Location.find_by(name: "Server 2")
    location = Location.find_by(name: "User's location")
require "pry"; binding.pry
    Result.closest_location(location, server1, server2)
  end
end

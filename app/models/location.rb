class Location < ApplicationRecord
  validates_presence_of :city, :state, :latitude, :longitude
end

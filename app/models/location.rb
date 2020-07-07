class Location < ApplicationRecord
  validates_presence_of :country, :state, :latitude, :longitude
end

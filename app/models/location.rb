class Location < ApplicationRecord
  validates_presence_of :name, :latitude, :longitude
end

class Geolocation < ActiveRecord::Base
  attr_accessible :address, :borough, :latitude, :longitude, :neighborhood
  has_many :scenes

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end

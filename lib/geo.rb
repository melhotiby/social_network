module Geo
  require 'geokit'
  include GeoKit::Geocoders

  def self.get_coords(location)
    coords = MultiGeocoder.geocode(location)
    [coords.lat, coords.lng] if coords.success
  end
end

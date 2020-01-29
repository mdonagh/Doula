class Service < ApplicationRecord
  has_many :registry_services
  
    scope :within, -> (latitude, longitude, distance_in_mile = 1) {
        where(%{
         ST_Distance(clinic_lonlat, 'POINT(%f %f)') < %d
        } % [longitude, latitude, distance_in_mile * 1609.34]) # approx
      }
end

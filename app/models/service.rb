class Service < ApplicationRecord
  has_many :registry_services
  
  has_one_attached :thumbnail

  validates :description, :presence => true, :length => { 
    :maximum => 300,
    :tokenizer => lambda { |str| str.scan(/\w+/) },
    :too_long  => "Please limit your summary to %{count} words"
  }

    scope :within, -> (latitude, longitude, distance_in_mile = 1) {
        where(%{
         ST_Distance(clinic_lonlat, 'POINT(%f %f)') < %d
        } % [longitude, latitude, distance_in_mile * 1609.34]) # approx
      }
end

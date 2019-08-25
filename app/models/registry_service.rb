class RegistryService < ApplicationRecord
  belongs_to :service
  belongs_to :registry
  has_many :service_increments

  def unpurchased_increments
    self.service_increments.where(purchased: false)
  end 
end

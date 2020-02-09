class Affiliate < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :update_terms_and_conditions

  has_many :services
  belongs_to :affiliate_plan

  def update_terms_and_conditions
    if contract_signed_changed?
      self.contract_signed_date = Time.now
      self.terms_and_conditions_id = TermsAndConditions.active.id
    end
  end

  def full_name 
    "#{self.contact_name['first_name']} #{self.contact_name['last_name']}"
  end 

  def full_address 
    address = self.address["street_address"]
    if !self.address["address_line2"].empty?
      address += ", #{self.address['address_line2']}"
    end 
    address += ", #{self.address['city']}, #{self.address['state']} #{self.address['zip_code']}"

    address 
  end 
end

class TermsAndConditions < ApplicationRecord
  after_create :set_active

  def set_active
    TermsAndConditions.update(active: false)
    self.update_columns(active: true)
  end

  def self.active
    TermsAndConditions.find_by(active: true)
  end

  def populate(user)
    keys = {
      "!{DATE}": Time.now.strftime("%m/%d/%Y"), 
      "!{COMPANY}": user.business_name, 
      "!{STATE}": user.address["state"],
      "!{ADDRESS}": user.full_address, 
      "!{PLAN_YEARLY_PRICE}": ActiveSupport::NumberHelper.number_to_currency(user.affiliate_plan.yearly_price, :unit => "$"),
      "!{PLAN_DISTANCE}": user.affiliate_plan.radius_miles || "unlimited"
    }

    terms = self.text 
    keys.each do |key, value|
      terms.gsub!(key.to_s, value.to_s)
    end 

    terms 
  end 
end

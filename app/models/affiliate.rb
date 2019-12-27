class Affiliate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :update_terms_and_conditions

  def update_terms_and_conditions
    if contract_signed_changed?
      self.contract_signed_date = Time.now
      self.terms_and_conditions_id = TermsAndConditions.active.id
    end
  end
end

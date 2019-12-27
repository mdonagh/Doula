class TermsAndConditions < ApplicationRecord
  after_create :set_active

  def set_active
    TermsAndConditions.update(active: false)
    self.update_columns(active: true)
  end

  def self.active
    TermsAndConditions.find_by(active: true)
  end
end

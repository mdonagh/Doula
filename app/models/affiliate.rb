class Affiliate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services

  def full_name 
    "#{self.contact_name['first_name']} #{self.contact_name['last_name']}"
  end 
end

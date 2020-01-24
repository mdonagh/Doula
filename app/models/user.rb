
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name 
    "#{self.first_name}  #{self.last_name}" 
  end 

  def wepay_authorization_url(redirect_uri)
    WePayService.authorization_url(redirect_uri, self.full_name, self.email)
  end

  def create_wepay_account
    response = WePayService.create_account(self.full_name, self.wepay_access_token)

    if response['error']
      return false #TBD how to handle this 
    elsif !response["account_id"]
      return false #TBD how to handle this 
    else 
      self.wepay_account_id = response["account_id"]
      return self.save
    end 
  end 

  def has_wepay_account?
    self.wepay_account_id != 0 && !self.wepay_account_id.nil?
  end

  def has_valid_wepay_access_token?
    if self.wepay_access_token.nil?
      return false
    end
    
    WePayService.token_valid?(self.wepay_access_token)
  end 

  def request_wepay_access_token(code, redirect_uri)
    response = WePayService.request_access_token(code, redirect_uri)
    if response['error']
      raise "Error - "+ response['error_description']
    elsif !response['access_token']
      raise "Error requesting access from WePay"
    else
      self.wepay_access_token = response['access_token']
      self.save
  
      #create WePay account
      self.create_wepay_account
    end
  end

  def end_affiliate_session
    # remove conditionals from new user/affiliate session views
    # log into the user account
    # create the user session
    # destroy the affiliate session
    # render the message
  end

  

end

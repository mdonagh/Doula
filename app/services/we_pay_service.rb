
class WePayService
    cattr_reader :wepay_client, instance_accessor: false do
        client_id = Rails.application.credentials.wepay[:client_id]
        client_secret = Rails.application.credentials.wepay[:client_secret]
        use_stage = Rails.application.config.wepay_use_stage 
        WePay::Client.new(client_id, client_secret, use_stage)
    end
  
    def self.authorization_url(redirect_uri, name, email)
        wepay_client.oauth2_authorize_url(redirect_uri, email, name)
    end
  
    def self.request_access_token(code, redirect_uri)
        binding.pry
        wepay_client.oauth2_token(code, redirect_uri)
    end

    def self.token_valid?(token)
        response = wepay_client.call("/user", token)
        binding.pry
        response && response["user_id"] 
    end 

    def self.create_account(name, access_token)
        params = { :name => name, :description => "Be Her Village -" + name }			
        wepay_client.call("/account/create", access_token, params)
    end 

    def self.create_checkout(access_token, params)
        wepay_client.call('/checkout/create', access_token, params)
    end 

    # def self.iframe_checkout(div, checkout_uri)
    #     wepay_client.iframe_checkout(div, checkout_uri)
    # end 
  end
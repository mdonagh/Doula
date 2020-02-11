class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy 

    def create_checkout(redirect_uri)
        user = User.find(self.line_items[0].registry_service.registry.user_id)
        wepay_account_id = user.wepay_account_id.to_i
        params = {
          :account_id => wepay_account_id,
          :short_description => "Be Her Village Checkout",
          :type => 'service',
          :currency => 'USD',
          :amount => self.total,			
          # :fee => {
          #     :app_fee => app_fee,
          #     :fee_payer => 'payee'
          # },
          :hosted_checkout => {
              :mode  => 'iframe',
              :redirect_uri => redirect_uri
          }
        }
        response = WePayService.create_checkout(user.wepay_access_token, params)
      
        # if !response
        #   raise "Error - no response from WePay"
        # elsif response['error']
        #   raise "Error - " + response["error_description"]
        # end
      
        return response
      end

      def total
        self.line_items.sum{ |item| item.registry_service.service_increments.first.price * item.quantity }
      end 

    # def purchase_increments(service, quantity)

    # end 

    # def checkout_wepay(total)
    #     # ActiveMerchant::Billing::Base.mode = :test
    #     # gateway = ActiveMerchant::Billing::WepayGateway.new
    #     # gateway.purchase(total, )
    # end 

end

class StripeChargesController < ApplicationController
    skip_before_action :user_logged_in?, only: :stripe_webhook
    protect_from_forgery except: :stripe_webhook

    def stripe_webhook
        stripe_response = StripeWebhooks.subscription_events(request)
    end

    def index
    end

    def new
        # @stripe_session = StripeService.create_session(current_affiliate.email, params[:plan])
        @stripe_session = StripeService.create_session(current_affiliate.email, 'plan_GLlLVOFWdoZqcw')
    end

    def success
        ### the Stripe {CHECKOUT_SESSION_ID} will be available in params[:session_id]
        
        if params[:session_id]
            flash.now[:success] = "Thanks for your Subscribing/Purchasing/Whatever..."
        else
            flash[:error] = "Session expired error...your implementation will vary"
            redirect_to subscriptions_path  ##TODO: change this 
        end
    end
    
    def cancel
        redirect_to subscriptions_path  ##TODO: change this 
    end
end

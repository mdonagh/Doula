class AffiliateSignupsController < ApplicationController
    include Wicked::Wizard 
    include StatesHelper
    skip_before_action :authenticate_user!
    before_action :authenticate_affiliate!, only: [:show]

    steps :contact_info, :terms_and_conditions, :payment_info

    def show 
        @affiliate = current_affiliate 
        @terms_and_conditions = TermsAndConditions.active.text
        @states = us_states
        service = StripeService.new(@affiliate)
        @stripe_session = service.create_session

        @step_total = wizard_steps.length + 1 
        @current_step_number = wizard_steps.find_index(step) + 2
        render_wizard 
    end 

    def update 
        @affiliate = current_affiliate
        @affiliate.update_attributes(contact_params)
        render_wizard @affiliate
    end 

    def contact_params
        params.require(:affiliate).permit(:business_name, :website, :phone, :contract_signed, contact_name: [:first_name, :last_name], address: [:street_address, :address_line2, :city, :state, :zip_code])
    end

end
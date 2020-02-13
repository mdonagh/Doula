class AffiliatesController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :validate_affiliate, :only => :show
    def show 
        @affiliate = Affiliate.find(params[:id]) 
    end 

    def validate_affiliate
        if current_affiliate.id.to_s != params[:id]
            redirect_to root_path 
        elsif !current_affiliate.contract_signed
            redirect_to affiliate_signups_path
        end 
    end
end

class AffiliatesController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :validate_affiliate, :only => :show
    def show 
        @affiliate = Affiliate.find(params[:id]) 
    end 

    def validate_affiliate
        redirect_to root_path unless current_affiliate.id.to_s == params[:id]
    end
end

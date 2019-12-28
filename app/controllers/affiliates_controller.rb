class AffiliatesController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :authenticate_affiliate!, only: [:show]
    def show 
        @affiliate = Affiliate.find(params[:id]) 
    end 
end

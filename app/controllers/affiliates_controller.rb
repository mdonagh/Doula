class AffiliatesController < ApplicationController
    def show 
        @affiliate = Affiliate.find(params[:id]) 
    end 
end

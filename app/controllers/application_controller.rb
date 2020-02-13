class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    before_action :authenticate_user!, unless: :devise_controller?

    def after_sign_in_path_for(resource)
        if resource.is_a?(Affiliate)
            affiliate_path(resource)
        end 

        ##TODO: SETUP FOR USERS 
    end 
end

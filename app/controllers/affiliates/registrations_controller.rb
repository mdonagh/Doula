# frozen_string_literal: true

class Affiliates::RegistrationsController < Devise::RegistrationsController
  include StatesHelper

  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @plan = AffiliatePlan.find_by(nickname: params.permit(:plan)[:plan].downcase)
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @states = us_states
    super
  end

  # PUT /resource
  def update
    @states = us_states
    super
  end

  def free_signup
    mc = MailchimpService.new 
    
    email = free_plan_params[:email]
    first_name = free_plan_params[:contact_name]["first_name"]
    last_name = free_plan_params[:contact_name]["last_name"]
    mc.add_user_to_list(email)
    mc.add_tag_to_free(email)
    mc.add_attributes(email, first_name, last_name)
    redirect_to :root, notice: "Successfully signed up!"
  end 

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def plans 
    @plans = [
      {
        name: "Local",
        cost: 25, 
        details: ["Custom business profile", "Reach audience up to 10 mile radius", "One service listing", "Monthly email promotion", "Instant alerts when service is added to a registry", "Instant alert when service is purchased"],
        recommended: false
      }, 
      {
        name: "Regional",
        cost: 45,
        details: ["Custom business profile", "Reach audience up to 100 mile radius",  "Up to 3 service listings", "Monthly email promotion", "Monthly Social Media promotion", "1 Feature full length article on BeHerVillage.com", "Instant alerts when added to registry", "Instance alerts when service is purchased"],
        recommended: true 
      },
      {
        name: "National",
        cost: 95,
        details: ["Custom business profile", "Reach a national audience", "Two category listings", "Up to 5 services", "Monthly email promotion", "Monthly Social Media promotion", "5 Feature full length articles on BeHerVillage.com", "Instant alerts when added to registry", "Instant alerts when service is purchased", "Monthly comprehensive performance report"],
        recommended: false
      }
    ]
  end 

  def select_plan
    redirect_to new_affiliate_registration_path(plan: plan_params[:button])
  end 

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business_name, :website, :phone, :affiliate_plan_id, contact_name: [:first_name, :last_name], address: [:street_address, :address_line2, :city, :state, :zip_code]])
  end

  def plan_params
    params.permit(:button)
  end 

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_name, :website, :phone, :affiliate_plan_id, contact_name: [:first_name, :last_name], address: [:street_address, :address_line2, :city, :state, :zip_code]])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    affiliate_signups_path
  end

  def free_plan_params
    params.require(:free_signup).permit(:business_name, :email, contact_name: [:first_name, :last_name])
  end 

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

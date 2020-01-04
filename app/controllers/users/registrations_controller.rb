# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # setup wepay payments for the user 
  def oauth 
    if !params[:code]
      return redirect_to('/')
    end 

    redirect_uri = url_for(:controller => 'registrations', :action => 'oauth', :userid => current_user.id, :host => request.host_with_port)
    @user = User.find(params[:userid])
    current_registry = Registry.find(@user.current_registry_id)
    begin
      @user.request_wepay_access_token(params[:code], redirect_uri)
    rescue => exception
      error = exception.message      
    end

    if error 
      redirect_to current_registry, alert: error 
    else
      redirect_to current_registry, notice: 'Successfully connected to WePay'
    end
  end 
  
  def setup_wepay 
    @user = current_user 
    @redirect_uri = url_for(:controller => 'registrations', :action => 'oauth', :userid => current_user.id, :host => request.host_with_port)
  end 

  # GET /resource/sign_up
  # def new
  #   super
  # end`

  # POST /resource
  def create
    super
    # if current_user
    #   redirect_to registry_steps_children_path
    #   # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb
    # end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    registry_steps_2_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

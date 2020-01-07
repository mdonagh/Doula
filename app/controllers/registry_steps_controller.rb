class RegistryStepsController < ApplicationController
  include Wicked::Wizard 
  include StatesHelper
  steps :party, :address, :payment

  def show 
    current_registry_id = current_user.current_registry_id
    @registry = Registry.find(current_registry_id)
    @states = us_states
    render_wizard
  end

  def update
    current_registry_id = current_user.current_registry_id
    @registry = Registry.find(current_registry_id)
    @registry.update_attributes(additional_params)

    #Setup WePay if selected 
    if @registry.accepts_wepay && (!current_user.has_valid_wepay_access_token? || !current_user.has_wepay_account?)
      # TODO check if they already have a wepay account setup 
      # format.html { redirect_to user_setup_wepay_path, notice: 'Registry was successfully created.'}
      # format.json { render :show, status: :created, location: @registry }
    end 
    
    render_wizard @registry
  end

  def additional_params
    params.require(:registry).permit(:shower_or_sprinkle, :shower_date, :cards_ordered, :phone_number, :accepts_check, :accepts_wepay, address: [:street_address, :address_line2, :city, :state, :zip_code])
  end
end

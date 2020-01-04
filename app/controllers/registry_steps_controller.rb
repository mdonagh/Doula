class RegistryStepsController < ApplicationController
  include Wicked::Wizard 
  steps :party, :address, :payment

  def show 
    current_registry_id = current_user.current_registry_id
    @registry = Registry.find(current_registry_id)
    render_wizard
  end

  def update
    current_registry_id = current_user.current_registry_id
    @registry = Registry.find(current_registry_id)
    @registry.update_attributes(party_params)
    render_wizard @registry
  end

  def party_params
    params.require(:registry).permit(:shower_or_sprinkle, :shower_date, :cards_ordered)
  end
end

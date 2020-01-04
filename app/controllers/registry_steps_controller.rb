class RegistryStepsController < ApplicationController
  include Wicked::Wizard 
  steps :party, :address, :payment

  def show 
    # @registry = Registry.find(params[:registry_id])
    binding.pry
    render_wizard
  end

  # def update
  #   @registry = Product.find(params[:registry_id])
  #   @registry.update_attributes(params[:registry])
  #   render_wizard @registry
  # end

  def create
    @registry = Registry.create
    redirect_to wizard_path(steps.first, registry_id: @registry.id)
  end
end

class RegistryStepsController < ApplicationController
  include Wicked::Wizard 
  steps :children, :party, :address, :payment

  def show 
    render_wizard
  end
  
end

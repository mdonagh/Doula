class AddNumberOfServicesToAffiliatePlans < ActiveRecord::Migration[5.2]
  def change
    add_column :affiliate_plans, :number_of_services, :int
  end
end

class AddLocationIndependentToAffiliates < ActiveRecord::Migration[5.2]
  def change
    add_column :affiliates, :location_independent, :boolean
  end
end

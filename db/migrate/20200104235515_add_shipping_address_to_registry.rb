class AddShippingAddressToRegistry < ActiveRecord::Migration[5.2]
  def change
    add_column :registries, :shipping_address, :boolean, default: true
  end
end

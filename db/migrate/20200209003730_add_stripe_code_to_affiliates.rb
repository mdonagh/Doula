class AddStripeCodeToAffiliates < ActiveRecord::Migration[5.2]
  def change
    add_column :affiliates, :stripe_code, :string
  end
end

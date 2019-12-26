class CreateAffiliatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :affiliate_plans do |t|
      t.string :stripe_code
      t.string :nickname
      t.decimal :radius_miles
      t.timestamps
    end
  end
end

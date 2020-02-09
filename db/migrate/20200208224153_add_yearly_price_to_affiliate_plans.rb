class AddYearlyPriceToAffiliatePlans < ActiveRecord::Migration[5.2]
  def change
    add_column :affiliate_plans, :yearly_price, :decimal
  end
end

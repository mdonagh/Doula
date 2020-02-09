class AddRecommendedToAffiliatePlans < ActiveRecord::Migration[5.2]
  def change
    add_column :affiliate_plans, :recommended, :boolean
  end
end

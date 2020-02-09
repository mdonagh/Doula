class ChangeAffiliatePlanIdColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :affiliates, :affiliate_plans_id, :affiliate_plan_id
  end
end

class CreateServiceIncrements < ActiveRecord::Migration[5.2]
  def change
    create_table :service_increments do |t|
      t.references :registry_service, foreign_key: true
      t.decimal :price
      t.boolean :purchased, default: false 

      t.timestamps
    end
  end
end

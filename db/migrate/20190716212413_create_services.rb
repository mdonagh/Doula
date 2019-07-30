class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :intervals
      t.references :service_categories 
      t.timestamps
    end
  end
end

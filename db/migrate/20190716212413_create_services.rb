class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :intervals
      t.references :service_category
      t.references :affiliate
      t.st_point :lonlat, geographic: true 
      t.decimal :radius 
      t.timestamps
    end

    add_index :services, :lonlat, using: :gist
  end
end

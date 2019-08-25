class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :registry_service, foreign_key: true
      t.belongs_to :cart, foreign_key: true
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end

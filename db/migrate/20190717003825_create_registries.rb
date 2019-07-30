class CreateRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :registries do |t|
      t.string :name
      t.hstore :address
      t.date :due_date
      t.integer :num_child 
      t.integer :gender 
      t.string :email
      t.string :phone_number 
      t.datetime :shower_date
      t.integer :shower_or_sprinkle
      t.boolean :cards_ordered, :default => false 
      t.boolean :cards_sent, :default => false 
      t.references :user 
      t.string :slug
      t.timestamps
    end

    add_index :slug,                unique: true
  end
end

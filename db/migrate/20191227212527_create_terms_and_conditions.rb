class CreateTermsAndConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :terms_and_conditions do |t|
      t.text :text
      t.boolean :active
      t.timestamps null: false
    end

    add_reference :affiliates, :terms_and_conditions, foreign_key: true
  end
end

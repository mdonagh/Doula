class CreateRegistries < ActiveRecord::Migration[6.0]
  def change
    create_table :registries do |t|

      t.timestamps
    end
  end
end

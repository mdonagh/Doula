class CreateRegistryServices < ActiveRecord::Migration[5.2]
  def change
    create_table :registry_services do |t|
      t.references :service, foreign_key: true
      t.references :registry, foreign_key: true

      t.timestamps
    end
  end
end

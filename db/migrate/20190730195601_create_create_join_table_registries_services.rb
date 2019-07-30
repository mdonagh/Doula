class CreateCreateJoinTableRegistriesServices < ActiveRecord::Migration[5.2]
  def change
    create_table :create_join_table_registries_services do |t|
      t.string :registries
      t.string :services

      t.timestamps
    end
  end
end

class AddChildNumberToRegistries < ActiveRecord::Migration[5.2]
  def change
    add_column :registries, :child_number, :integer
  end
end

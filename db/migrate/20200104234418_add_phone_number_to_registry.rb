class AddPhoneNumberToRegistry < ActiveRecord::Migration[5.2]
  def change
    add_column :registries, :phone_number, :string
  end
end

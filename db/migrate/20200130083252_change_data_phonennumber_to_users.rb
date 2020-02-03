class ChangeDataPhonennumberToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :phonennumber, :string
  end
end

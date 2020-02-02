class ChangeDataTelToAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :tel, :string
  end
end

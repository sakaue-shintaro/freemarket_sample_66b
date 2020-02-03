class ChangeDataPriceToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :bigint
  end
end

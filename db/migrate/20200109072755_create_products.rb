class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references  :seller, null: false, foreign_key: { to_table: :users }
      t.references  :buyer, foreign_key: { to_table: :users }
      t.string  :name,           null: false
      t.text    :discription,    null: false
      t.references  :category, null: false, foreign_key: true
      t.string  :brand
      t.string  :state,          null:false
      t.string  :delivery_fee,   null:false
      t.string  :sending_method, null:false
      t.string  :sending_area,   null:false
      t.string  :sending_day,    null:false
      t.integer :price,          null:false
      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,     null: false
      t.string :prefectuer,      null: false
      t.string :city_ward,       null: false
      t.string :address,         null: false
      t.string :building
      t.string :tel,             null: false
      t.string :user_id,         null: false
      t.timestamps
    end
  end
end

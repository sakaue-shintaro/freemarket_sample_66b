class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,     null: false
      t.string :prefectuer,      null: false
      t.string :city_ward,       null: false
      t.string :address,         null: false
      t.string :building
      t.integer :tel
      t.references  :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

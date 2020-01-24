class CreatePays < ActiveRecord::Migration[5.0]
  def change
    create_table :pays do |t|
      t.references :user, foreign_key: true,null: false
      t.integer :number,       null:false
      t.integer :year,         null:false
      t.integer :month,        null:false
      t.integer :code,         null:false
      t.timestamps
    end
  end
end

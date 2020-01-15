class Images < ActiveRecord::Migration[5.0]
  def change
      create_table :images do |t|
        t.integer :product_id,   null: false, foreign_key: true
        t.text    :url,          null: false
        t.timestamps
    end
  end
end

class ShowCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :pass,  null:false
      t.text :item,  null:false
      t.timestamps
  end
end
end

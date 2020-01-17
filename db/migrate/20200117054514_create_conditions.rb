class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.text:name
      t.timestamps
    end
  end
end

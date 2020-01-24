class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :good,      null: false, default: 0
      t.integer :normal,    null: false, default: 0
      t.integer :bad,       null: false, default: 0
      t.references  :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.string :leave_type
      t.boolean :approved, default: false

      t.timestamps null: false
    end
  end
end

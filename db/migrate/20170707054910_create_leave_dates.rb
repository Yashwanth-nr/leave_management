class CreateLeaveDates < ActiveRecord::Migration
  def change
    create_table :leave_dates do |t|
      t.date :leave_date
      t.string :leave_type
      t.integer :leave_id

      t.timestamps null: false
    end
  end
end

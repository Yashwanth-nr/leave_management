class ChangeColumnToLeaves < ActiveRecord::Migration
  def change
  	change_column :users, :cl, :float
  end
end

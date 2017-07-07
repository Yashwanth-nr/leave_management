class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cl, :integer,default: 10
  end
end

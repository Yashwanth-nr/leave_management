class RemoveColumnFromLeaves < ActiveRecord::Migration
  def change
  	remove_column :leaves,:leave_type
  end
end

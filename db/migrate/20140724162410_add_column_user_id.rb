class AddColumnUserId < ActiveRecord::Migration
  def change
  	add_column :visits, :user_id, :integer
  end
end

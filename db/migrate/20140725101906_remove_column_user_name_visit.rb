class RemoveColumnUserNameVisit < ActiveRecord::Migration
  def change
  	remove_column :visits, :user_name, :string
  end
end

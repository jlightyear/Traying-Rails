class RemovePwDaddUserSurname < ActiveRecord::Migration
  def change
  	remove_column :users, :pwd
  	add_column :users, :surname, :string
  end
end

class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    	t.references :location
    	t.string :name
      t.timestamps
    end
  end
end

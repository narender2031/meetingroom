class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.integer :total_meeting_room

      t.timestamps
    end
  end
end

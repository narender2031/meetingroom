class AddRoomToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_meeting_room, :integer
  end
end

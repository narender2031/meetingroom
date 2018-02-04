class AddMeetingRoomCodeToMeetingRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :meeting_rooms, :meeting_room_code, :string
  end
end

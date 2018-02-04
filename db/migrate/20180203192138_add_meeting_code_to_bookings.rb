class AddMeetingCodeToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :meeting_room_booking_code, :string
  end
end

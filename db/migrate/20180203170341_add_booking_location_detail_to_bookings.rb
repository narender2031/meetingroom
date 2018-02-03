class AddBookingLocationDetailToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :location_id, :integer
    add_column :bookings, :meeting_room_id, :integer
  end
end

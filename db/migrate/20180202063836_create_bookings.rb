class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.datetime :booking_date
      t.float :booking_start_time
      t.float :duration
      t.integer :seats

      t.timestamps
    end
  end
end

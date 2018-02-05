# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
l = Location.create!(location_name: 'Chandigrah', total_meeting_room: 2)
m = MeetingRoom.create!(name: "Meeting romm 1", location_id: 1);
u = User.create!(name: "example", phone:"9999999999", email:"user@example.com", password:"manu2031", location_id:1)
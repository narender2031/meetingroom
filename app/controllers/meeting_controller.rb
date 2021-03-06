class MeetingController < ApplicationController
    before_action :authorize
    def index
        @user = current_user
        if @user.location_id == nil
            @user.location_id = Location.last.id
            @user.save
        end
        if @user.meeting == nil
            @time_req = Time.now.to_date
            @user.meeting = @time_req
            @user.save
            @bookings = Booking.new
            @meeting_booked = Booking.where(location_id: current_user.location_id)
        
            @locations = Location.all
        
            @user_location = Location.find(current_user.location_id);
            @meeting_rooms = MeetingRoom.where(location_id: current_user.location_id)
            if @meeting_rooms.blank?
            else
                if current_user.current_meeting_room == nil
                    current_user.current_meeting_room =  @meeting_rooms[0].id
                    @current_user.save
                end
            end
            @current_meeting_room = MeetingRoom.where(id: current_user.current_meeting_room);
            @meeting_room_default = MeetingRoom.find(current_user.current_meeting_room)
            
        else
            @time_req = @user.meeting.to_date
            @bookings = Booking.new
            @meeting_booked = Booking.where(location_id: current_user.location_id)
            
            @locations = Location.all
            @user_location = Location.find(current_user.location_id);
            @meeting_rooms = MeetingRoom.where(location_id: current_user.location_id)
            if @meeting_rooms.blank?
            else   
                @meeting_room_id =  current_user.current_meeting_room
                @meetId = @meeting_rooms.where(id: @meeting_room_id)
                 
                if @meetId.blank?
                    current_user.current_meeting_room =  @meeting_rooms[0].id
                    @current_user.save
                end
            end
            @current_meeting_room = MeetingRoom.where(id: current_user.current_meeting_room);
            @meeting_room_default = MeetingRoom.find(current_user.current_meeting_room)
           
             
        end
    end

    def create
        @bookings = Booking.new
        @bookings.user_id = booking_params[:user_id]

        @bookings.booking_date = current_user.meeting.to_date
        @bookings.booking_start_time = booking_params[:booking_start_time]
        @bookings.duration = booking_params[:duration]
        @bookings.seats = booking_params[:seats]
        @bookings.location_id = booking_params[:location_id]
        @bookings.meeting_room_id = booking_params[:meeting_room_id]
        @bookings.meeting_room_booking_code = booking_params[:meeting_room_booking_code]
        @bookings.save
        redirect_to meeting_path
    end
   
end
private
def booking_params 
    params.require(:booking).permit(:seats, :booking_start_time, :duration, :user_id, :booking_date, :location_id, :meeting_room_id, :meeting_room_booking_code )
end

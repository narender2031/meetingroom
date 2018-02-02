class MeetingController < ApplicationController
    before_action :authorize
    def index
        @user = current_user
        if @user.meeting == nil
            @time_req = Time.now.to_date
            @user.meeting = @time_req
            @user.save
            @bookings = Booking.new
            @meeting_booked = Booking.all
            @meeting_booked.each do |meeting| 
                if meeting.booking_date.to_date ==  @time_req
                    puts "yupppp"
                end
            end
        else
            @time_req = @user.meeting.to_date
            @bookings = Booking.new
            @meeting_booked = Booking.all
            @meeting_booked.each do |meeting| 
                # month is act like a date 
                 meeting_day =  meeting.booking_date.month
                if meeting_day == @time_req.day
                    @booking_start_time = meeting.booking_start_time
                    if @booking_start_time == 9
                        @start_at = 9
                        @total_duration_nine = meeting.duration 
                    end
                    if @booking_start_time == 9.30
                        @start_at_nine_half = 9.30
                        @total_duration_nine_half = meeting.duration
                    end
                    if @booking_start_time == 10
                        @start_at_ten = 10
                        @total_duration_ten = meeting.duration
                    end
                    if @booking_start_time == 10.30
                        @start_at_ten_half = 10.30
                        @total_duration_ten_half = meeting.duration 
                    end
                    if @booking_start_time == 11
                        @start_at_elevan = 11
                        @total_duration_elevan = meeting.duration
                    end
                    if @booking_start_time == 11.30
                        @start_at_elevan_half = 11.30
                        @total_duration_elevan_half = meeting.duration
                        puts @total_duration
                    end
                    if @booking_start_time == 12
                        @start_at_twelve = 12
                        @total_duration_twelve = meeting.duration 
                    end
                    if @booking_start_time == 12.30
                        @start_at_twelve_half = 12.30
                        @total_duration_twelve_half  = meeting.duration
                    end
                    if @booking_start_time == 1
                        @start_at_one = 1
                        @total_duration_one = meeting.duration
                        puts @total_duration
                    end
                    if @booking_start_time == 1.30
                        @start_at_one_half = 1.30
                        @total_duration_one_half = meeting.duration 
                    end
                    if @booking_start_time == 2
                        @start_at_two = 2
                        @total_duration_two = meeting.duration
                    end
                    if @booking_start_time == 2.30
                        @start_at_two_half = 2.30
                        @total_duration_two_half = meeting.duration
                        puts @total_duration
                    end
                    if @booking_start_time == 3
                        @start_at_three = 3
                        @total_duration_three = meeting.duration 
                    end
                    if @booking_start_time == 3.30
                        @start_at_three_half = 3.30
                        @total_duration_three_half  = meeting.duration
                    end
                    if @booking_start_time == 4
                        @start_at_four = 4
                        @total_duration_four = meeting.duration
                        puts @total_duration
                    end
                    if @booking_start_time == 4.30
                        @start_at_four_half = 4.30
                        @total_duration_four_half  = meeting.duration 
                    end
                    if @booking_start_time == 5
                        @start_at_five = 5
                        @total_duration_five = meeting.duration
                    end
                    if @booking_start_time == 5.30
                        @start_at_five_half = 5.30
                        @total_duration_five_half = meeting.duration
                    end
                    if @booking_start_time == 6
                        @start_at_six = 6
                        @total_duration_six = meeting.duration 
                    end
                    if @booking_start_time == 6.30
                        @start_at_six_half = 6.30
                        @total_duration_six_half = meeting.duration
                    end
                    if @booking_start_time == 7
                        @start_at_seven = 7
                        @total_duration_seven = meeting.duration
                    end
                    if @booking_start_time == 7.30
                        @start_at_seven_half = 7.30
                        @total_duration_seven_half = meeting.duration 
                    end
                    if @booking_start_time == 8
                        @start_at_eight = 8
                        @total_duration_eight = meeting.duration
                    end
                    if @booking_start_time == 8.30
                        @start_at_eight_half = 8.30
                        @total_duration_eight_half = meeting.duration
                    end
                end
            end    
        end
    end

    def create
        @bookings = Booking.new
        puts booking_params[:booking_date].to_date
        @bookings.user_id = booking_params[:user_id]
        @bookings.booking_date = booking_params[:booking_date].to_date
        @bookings.booking_start_time = booking_params[:booking_start_time]
        @bookings.duration = booking_params[:duration]
        @bookings.seats = booking_params[:seats]
        @bookings.save


        redirect_to meeting_path

    end
   
end
private
def booking_params 
    params.require(:booking).permit(:seats, :booking_start_time, :duration, :user_id, :booking_date )
end

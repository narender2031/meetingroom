class BookingsController < ApplicationController
    before_action :authorize
    def index
        @user = current_user
        if @user.location_id == nil
            @user.location_id = Location.last.id
            @user.save
            @bookings = Booking.where(user_id: @user.id);
        else
            @bookings = Booking.where(user_id: @user.id);
        end

    end

end

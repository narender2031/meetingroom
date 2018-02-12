class BookingsController < ApplicationController
    before_action :authorize
    def index
        @user = current_user
        if @user.location_id == nil
            @user.location_id = Location.last.id
            @user.save
            @bookings = Booking.where(location_id: @user.location_id);
        else
            @bookings = Booking.where(location_id: @user.location_id);
        end

    end

end

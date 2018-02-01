class MeetingController < ApplicationController
    before_action :authorize
    def index
        @user = current_user
        if @user.meeting == nil
            @time_req = Time.now.to_date
            @user.meeting = @time_req
            @user.save
        else
            @time_req = @user.meeting.to_date
            puts @time_req
            puts "MAnuuuu"
        end
    end
end

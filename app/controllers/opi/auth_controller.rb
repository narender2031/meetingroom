class Opi::AuthController < Opi::OpiController
    before_action :authenticate
    
    def index
        params[:value]
        puts params[:value]
        puts "hello"
        @time = params[:value]
        if @time.blank?
        else
            @user = current_user
            puts @time.to_date
            @user.meeting = @time.to_date
            @user.save
            render json: {"Success": "Hello"}
        end
       
    end

    def meeting_location
      location_id =   params[:location]
      puts location_id
        if location_id.blank?
            puts "helllo"
        else
           @user = current_user
           @user.location_id = location_id
           @user.save 
           render json: {"Success": "Hello"}
        end
    end

    def meeting_room
        meeting_room_id = params[:meeting_room_id]
        puts meeting_room_id
        if meeting_room_id.blank?
        else
            current_user.current_meeting_room = meeting_room_id
            current_user.save
            render json: {"message": "Success"}
        end
       
    end
end
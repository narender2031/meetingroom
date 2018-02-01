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
            @user.meeting = @time.to_date
            @user.save
        end
        render json: {"Success": "Hello"}
    end
end
class LoginController < ApplicationController
    def index
    end
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            cookies[:token] = user.token
            puts user.id
            puts user.token
            redirect_to meeting_path 
        else
            flash.now.alert = "Email or password is invalid"
            render :index
            puts "Fail"
        end
       
    end
end

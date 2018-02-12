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
            flash[:error]= "Email or password is invalid"
            redirect_to login_path
            puts "Fail"
        end
       
    end
    def logout
        @user = current_user
        @user.meeting = nil
        @user.save
        session[:user_id] = nil
        cookies[:token] = nil
        redirect_to login_path
    end
end

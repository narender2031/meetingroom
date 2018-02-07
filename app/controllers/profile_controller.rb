class ProfileController < ApplicationController
    before_action :authorize
    def index
        @user = current_user
    end
    def updateProfile
        @user = current_user
        if user_update_params[:name].blank?
            redirect_to profile_path
        elsif user_update_params[:email].blank?
            redirect_to profile_path
        elsif  user_update_params[:phone].blank?
            redirect_to profile_path
        else
            if user_update_params[:email] == current_user.email
                flash[:alert] = "Nothing to update"
                redirect_to profile_path
            else
                @user_email = User.find_by(email: user_update_params[:email])
                if @user_email.blank?
                    if @user.update(user_update_params)
                        flash[:success] = "Your account detial has been updated!"
                        redirect_to profile_path
                   else
                        flash[:alert] = "Bummer! This email is taken by another user"
                        redirect_to profile_path
                   end
                else
                    redirect_to profile_path
                end
            end
           
        end
        
    end
    def password
        @user = current_user
    end
    def updatePassword
        if password_update_params[:current_password].blank?
            redirect_to profile_path
        elsif password_update_params[:new_password].blank?
            redirect_to profile_path
        elsif password_update_params[:confirm_password].blank?
            redirect_to profile_path
        else
            if password_update_params[:new_password] != password_update_params[:confirm_password]
                redirect_to profile_path
            else
                if current_user.authenticate(password_update_params[:current_password])
                    current_user.password = password_update_params[:new_password]
                    current_user.save
                    redirect_to password_path
                else

                end
            end
        end
    end
    private
    def user_update_params
        params.require(:user).permit(:name,:email,:phone)
    end
    def password_update_params
        params.require(:user).permit(:current_password,:new_password,:confirm_password)
    end
end

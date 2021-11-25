class SessionsController < ApplicationController
    def create
        check_flash = return_flash(login_params)
        if check_flash == "noone"
            user = User.find_by(login:login_params[:login])
            session[:user_id] = user.id 
            redirect_to user
        else
            flash[:login_errors] = [check_flash]
            redirect_to '/'
        end 
    end
    def show
        @user = User.find(params[:id])
    end
    private   
        def login_params
            params.require(:user).permit(:login, :password)
        end
        def return_flash(user_params)
            user = User.find_by(login:user_params[:login])
            if user
                if user[:password] == user_params[:password]
                    return "noone"
                else
                    return "Неправильный пароль"
                end
            else
                return "Неправильный логин"
            end
        end
end
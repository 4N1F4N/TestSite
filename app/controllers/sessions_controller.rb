class SessionsController < ApplicationController
    def create
        user = User.find_by(login:login_params[:login])
        if user
            if user[:password] == login_params[:password]
                session[:user_id] = user.id 
                redirect_to user
            else
                flash[:login_errors] = ["Неправильный пароль"]
            end
        else
            flash[:login_errors] = ["Неправильный логин"]
        end
        redirect_to '/'
    end
    def show
        @user = User.find(params[:id])
    end
    private def login_params
        params.require(:user).permit(:login, :password)
    end
end
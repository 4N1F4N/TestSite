class SessionsController < ApplicationController
    def create
        user = User.find_by(login_params)
        if user
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:login_errors] = ['invaild credentials']
            redirect_to '/'
        end
    end
    def show
        @user = User.find(params[:id])
    end
    private def login_params
        params.require(:user).permit(:login, :password)
    end
end
class UsersController < ApplicationController
    def index

    end
    def show
        @user = User.find(params[:id])
    end
    def access
        
    end
    def create
        if !User.find_by(login:user_params[:login])
            if !(user_params[:login] == "")
                if !(user_params[:password] == "")
                    user = User.new(user_params)
                    session[:user_id] = user.id 
                    redirect_to access_path
                else
                    flash[:register_errors] = ["Пустой пароль"]
                end
            else
                flash[:register_errors] = ["Пустой логин"]
            end
        else
            flash[:register_errors] = ["Такой логин уже есть"]
        end
        redirect_to '/'
    end
    private 
        def user_params
            params.require(:user).permit(:login, :password)
        end
end

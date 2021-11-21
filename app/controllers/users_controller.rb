class UsersController < ApplicationController
    def index

    end
    def show
        @user = User.find(params[:id])
    end
    def access
        
    end
    def create
        if !User.find_by(login:user_params[:login]) && !(user_params[:login] == "") && !(user_params[:password] == "") 
            user = User.new(user_params)
            if user.save 
                session[:user_id] = user.id 
                redirect_to access_path
            else
                #flash[:register_errors] = user.errors.full_messages
                redirect_to '/'
            end
        else
            #flash[:register_errors] = user.errors.full_messages
            redirect_to '/'
        end
    end
    private def user_params
        params.require(:user).permit(:login, :password)
    end
end

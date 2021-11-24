class UsersController < ApplicationController
    def index

    end
    def show
        @user = User.find(params[:id])
    end
    def access
        
    end
    def create
        check_flash = return_flash(register_params)
        if check_flash == "noone"
            user = User.new(register_params)
            session[:user_id] = user.id 
            redirect_to access_path
        else
            flash[:register_errors] = [check_flash]
            redirect_to '/'
        end
    end
    private 
        def register_params
            params.require(:user).permit(:login, :password)
        end
        def return_flash(user_params)
            if !User.find_by(login:user_params[:login])
                if !(user_params[:login] == "")
                    if !(user_params[:password] == "")
                        return "noone"
                    else
                        return "Пустой пароль"
                    end
                else
                    return  "Пустой логин"
                end
            else
                return "Такой логин уже есть"
            end
        end
end

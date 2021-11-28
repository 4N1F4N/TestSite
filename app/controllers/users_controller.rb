class UsersController < ApplicationController


    def index
        if session[:user_id]
            @user = User.find_by(id:session[:user_id])
        end
    end
    def show
        if User.find_by(id:params[:id])
            if User.find_by(id:params[:id]).id == session[:user_id]
                @user = User.find(params[:id])
            else
                flash[:account_errors] = [t("errors.account_login_error")]
            end
        else
            flash[:account_errors] = [t("errors.account_exist_error")]
        end
    end
    def create
        user = User.new(register_params)
        if user.save
            session.clear
            session[:user_id] = user.id
            flash[:register_success] = [t("success.register_success")]
            redirect_to '/'
        else
            flash[:register_errors] = [t("errors.register_error")]
            redirect_to '/'
        end
    end
    private 
        def register_params
            params.require(:user).permit(:login, :password, :password_confirmation)
        end
end

class SessionsController < ApplicationController
    def create
        user = User.find_by(login:login_params[:login])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:login_errors] = [t("errors.login_error")]
            redirect_to '/'
        end 
    end
    private   
        def login_params
            params.require(:user).permit(:login, :password)
        end
end
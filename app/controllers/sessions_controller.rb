class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email], password:params[:password])
        if user
            session[:email] = user.email
            redirect_to :controller =>'dasboard', :action =>'index', notice: "Logged in successfully"
        else
            redirect_to  :controller =>'users', :action =>'registration', notice: "email or password is wrong!!"
        end
    end

    def destroy
        session[:email] = nil
        redirect_to root_path, notice: "Logged out successfully"
    end
end
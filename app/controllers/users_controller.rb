class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def registration
    end


    def login
        @user = User.find_by(email: params[:email], password:params[:password])
        if @user
            session[:user] = @user
            redirect_to :controller =>'dashboard', :action =>'index', notice: "Logged in successfully"
        else
            flash[:notice] = "email or password is wrong!!"
            redirect_to :action =>'registration'
        end
    end

    def logout
        session[:user] = nil
        redirect_to root_path, notice: "Logged out successfully"
    end


    def create
        params['user'] = params
        @user = User.new(user_params)
        if @user.save
            redirect_to :action => 'new', notice: 'User has been created Successfully!!'
        else
            redirect_to :action => 'registration' 
        end
    end

    def edit
        @user = User.find_by(email: params[:email], id: params[:id])
    end

    def update
        @user = User.find_by(email: params['email'], id: params['id'])
        params['phone'] = params['phone'].to_s
        params['user'] = params
        if @user.update(user_params)
            flash[:notice] ="Employee's details has been updated Successfully!!"
            redirect_to :action => 'index', notice: "Employee's details has been updated Successfully!!"
        else
            flash[:notice] ="Couldn't updated, try again!!"
            redirect_to :action => 'edit', notice: "Couldn't updated, try again!!"
        end
    end

    def delete
        Patient.find_by(email: params['email'], id: params['id']).destroy
        flash[:warning] ='Appointment has been deleted Successfully!!'
        redirect_to :action => 'show', notice: 'Appointment has been deleted Successfully!!'
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :phone, :address, :password, :role)
    end
end

class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

    def new

    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:success] = "Welcome, #{@user.to_s}"
            redirect_to user_path(@user.id)
        else
            flash[:danger] = "Please check username or password."
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end
end

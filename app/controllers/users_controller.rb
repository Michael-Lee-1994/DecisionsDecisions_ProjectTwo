class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    before_action :get_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
            flash[:success] = 'Account was successfully created.'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Account was successfully updated."
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def destroy
        @user.destroy
        redirect_to login_path
        flash[:success] = "Account was successfully deleted."
    end

    private 

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end
end

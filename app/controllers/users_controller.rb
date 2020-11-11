class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    before_action :get_user, only: [:show, :edit, :update, :destroy]


    def index
        # if params[:all]
        #     @users = User.all
        # else
        #     @users = User.where(user_id: params[:user_id])
        # end
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
            redirect_to @user, notice: 'Account was successfully created.'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: 'Account was successfully updated.'
        else
            render 'edit'
        end
    end
    
    def destroy
        @user.destroy
        redirect_to login_path, notice: 'Account was successfully deleted.'
    end

    private 

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, address_attributes:[:street_name, :city, :state, :zipcode, :country])
    end
end

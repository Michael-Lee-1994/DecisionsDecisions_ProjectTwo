class UserChoicesController < ApplicationController
    def new
        id = params[:user_id]
        if id && @user = User.find_by_id(id)
            @user_choice = @user.user_choices.build
        else
            @user_choice = current_user.user_choices.build
        end
    end

    def create
        # byebug
        @user_choice = UserChoice.new(uc_params)
        if @user_choice.save
            # session[:user_choice_id] = @user_choice.id
            redirect_to @user_choice.user
        else
            render 'new'
        end
    end

    private
    def uc_params
        params.require(:user_choice).permit(:user_id, :choice_id)
    end
end

class UserChoicesController < ApplicationController
    def new
        id = params[:user_id]
        if id && @user = User.find_by_id(id)
            @user_choice = @user.user_choices.build
        else
            @user_choice = current_user.user_choices.build
            @user_choice.choice
        end
        # @user_choice = UserChoice.new
    end

    def create
        # byebug
        @user_choice = UserChoice.new(uc_params)
        if @user_choice.save
            redirect_to user_path(current_user)
        else
            render 'new'
        end
    end

    private
    def uc_params
        params.require(:user_choice).permit(:user_id, :choice_id)
    end
end

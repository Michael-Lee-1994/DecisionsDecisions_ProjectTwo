class ChoicesController < ApplicationController
    def show
        @choice = Choice.find(params[:id])
    end

    def new
        @choice = Choice.new
    end

    def create
        # byebug
        @choice = Choice.new(choice_params)
        if @choice.save
            session[:choice_id] = @choice.id
            redirect_to new_user_choice_path
        else
            render :new
        end
    end

    private
    def choice_params
        params.require(:choice).permit(:choice_name, :date, :completed, :location_zip)
    end
end

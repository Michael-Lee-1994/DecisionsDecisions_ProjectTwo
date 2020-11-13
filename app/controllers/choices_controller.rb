class ChoicesController < ApplicationController
    before_action :get_choice, only: [:show, :edit, :update, :destroy]
    
    def show
        @choice = Choice.find(params[:id])
    end

    def new
        @choice = current_user.choices.build
    end

    def create
        @choice = current_user.choices.create(choice_params)
        if @choice.save
            session[:choice_id] = @choice.id
            redirect_to activities_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        @choice.update(choice_params)
        redirect_to @choice
        flash[:success] = 'Choice was successfully updated.'
    end

    def destroy
        @choice.destroy
        redirect_to current_user
        flash[:success] = "Choice was successfully deleted."
    end

    private

    def get_choice
        @choice = Choice.find(params[:id])
    end

    def choice_params
        params.require(:choice).permit(:choice_name, :date, :completed, :location_zip)
    end
end

class ActivitiesController < ApplicationController
    
    def index
        @activities = Activity.all
    end
    
    def show
        @activity = Activity.find(params[:id])
    end

    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.new(activity_params)
        if @activity.save
            session[:activity_id] = @activity.id
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    private
    def activity_params
        params.require(:activity).permit(:name, :category, :genre_cuisine)
    end

end

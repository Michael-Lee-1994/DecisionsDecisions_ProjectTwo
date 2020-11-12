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
        if params[:food]
            @activity = current_choice.choice_activities.create(activity_id: get_random("food").id)
            if @activity.save
                redirect_to activities_path
                flash[:success] = "Succesfully added #{@activity.activity.name}"
            else
                render :new
            end
        elsif params[:movie]
            @activity = current_choice.choice_activities.create(activity_id: get_random("movie").id)
            if @activity.save
                redirect_to activities_path
                flash[:success] = "Succesfully added #{@activity.activity.name}"
            else
                render :new
            end
        else
            @activity = current_choice.activities.create(activity_params)
            if @activity.save
                redirect_to user_path(current_user)
                flash[:success] = "Succesfully added #{@activity.name}"
            else
                render :new
            end

        end
    end

    private
    def activity_params
        params.require(:activity).permit(:name, :category, :genre_cuisine)
    end

    def get_random(type)
        activity = nil
        if type == "food"
            activity = Activity.where("category LIKE ?", "food").sample
        elsif type == "movie"
            activity = Activity.where("category LIKE ?", "movie").sample
        else
            activity = Activity.find(Random.new(100))
        end 
        p activity
    end
end

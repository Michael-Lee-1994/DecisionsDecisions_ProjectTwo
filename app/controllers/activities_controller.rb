class ActivitiesController < ApplicationController
    
    def index
        @activities = Activity.all
    end
    
    def show
        @activity = Activity.find(params[:id])
    end

    def new
        # byebug
        @activity = Activity.new
    end

    def create
        if params[:food]
            @activity = current_choice.choice_activities.create(activity_id: get_random("food").id)
            if @activity.save
                redirect_to activities_path
            else
                render :new
            end
        elsif params[:movie]
            @activity = current_choice.choice_activities.create(activity_id: get_random("movie").id)
            if @activity.save
                redirect_to activities_path
            else
                render :new
            end
        else
            @activity = current_choice.activities.create(activity_params)
            if @activity.save
                # session[:activity_id] = @activity.id
                redirect_to user_path(current_user)
            else
                render :new
            end

        end
    end

    # def food
    #     @activity = current_choice.choice_activities.create(activity_id: get_random("food").id)
    #     if @choice.save
    #         redirect_to activities_path
    #     else
    #         render :new
    #     end
    # end

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

    # def random_params
    #     params.require(:choice_activites).permit(:choice_id, :activity_id)
    # end

end

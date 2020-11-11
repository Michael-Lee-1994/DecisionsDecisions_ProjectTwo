class ChoiceActivitiesController < ApplicationController
    def new
        @choice_activity = ChoiceActivity.new
    end

    def create
        @choice_activity = ChoiceActivity.new(ca_params)
        if @choice_activity.save
            session[:choice_activity_id] = @choice_activity.id
            redirect_to @choice_activity.choice
        else
            render :new
        end
    end

    # def random_food
    #     @activity = current_user.activities.create(get_random("food"))
    #     if @choice.save
    #         redirect_to activities_path
    #     else
    #         render :new
    #     end
    # end
    

    private
    def ca_params
        params.require(:choice_activity).permit(:activity_id, :choice_id)
    end

    # def get_random(type)
    #     activity = nil
    #     if type == "food"
    #         activity = Activity.where("type LIKE ?", "food").sample
    #     elsif type == "movie"
    #         activity = Activity.where("type LIKE ?", "movie").sample
    #     else
    #         activity = Activity.find(Random.new(100))
    #     end 
    #     activity
    # end
end

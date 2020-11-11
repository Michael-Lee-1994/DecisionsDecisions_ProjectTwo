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

    private
    def ca_params
        params.require(:choice_activity).permit(:activity_id, :choice_id)
    end
end

class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    # def show
    #     activity = Activity.find(params[:id])
    #     render json: activity, status: :ok
    # end

    def destroy
        activity = Activity.find(params[:id])
        if activity
            activity.destroy
            render head :no_content
        else
            render json: { error: " Activity not found" }, status: :not_found
        end
    end

end

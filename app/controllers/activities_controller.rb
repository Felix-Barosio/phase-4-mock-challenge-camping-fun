class ActivitiesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Activity.all, status: :ok
    end

    def show
        activity = Activity.find(params[:id])
        render json: activity
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        render json: { message: "Activity Deleted" }, status: :ok
    end


    private

    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
    end

end

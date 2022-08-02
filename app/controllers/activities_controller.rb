class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    def index
        activities=Actvity.all
        render json: activities
    end

    def destroy
        activity=Actvity.find(params[:id])
        activity.destroy
        head :no_content
    end


    private
    
    def camper_params
        params.permit(:name, :difficulty)
    end
    
    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
    end
    
    def render_invalid_response invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

end
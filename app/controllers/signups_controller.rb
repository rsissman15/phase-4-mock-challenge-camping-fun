class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: render_invalid_response

    def create
        signup=Signup.create!(signup_params)
        activity=Activity.find(signup_params[:activity_id])
        render json: activity
    end

    private 
    def signup_params
        params.permit(:camper_id,:activity_id,:time)

    end
    def render_not_found_response
        render json:{error:"Signup not found"}, status: :not_found
    end

    def render_invalid_response
        render json: {errors:invalid.record.errors}, status: :unprocessable_entity
    end
end
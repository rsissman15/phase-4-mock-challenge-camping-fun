class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
    
    def index
        campers=Camper.all
        render json: campers
    end

    def show
        camper=Camper.find(params[:id])
        render json :camper
    end

    def create
        camper=Camper.create!(camper_params)
        render json :camper

    end

    private
    
    def camper_params
        params.permit(:name, :age)
    end
    
    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end
    
    def render_invalid_response invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
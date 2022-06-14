class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error

    def index 
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = find_camper
        render json: camper, status: :ok
    end

    def create
        camper = Camper.create(camper_params)
        if camper
            render json: camper, status: :created
        else
            render json: { error: "Validation errors" }, status: 404
        end
    end

    private

    def render_not_found_error
        render json: {error: "Camper not found"}, status: :not_found
    end

    def find_camper
        Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end
end

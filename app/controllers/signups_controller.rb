class SignupsController < ApplicationController

    def index
        signups = Signup.all
        render json: signups, status: :ok
    end

    def show
        signup = Signup.find(params[:id])
        render json: signup, status: :ok
    end

    def create
        signup = signup.create(signup_params)
        if signup
            render json: signup, status: :created
        else
            render json: { error: "Validation errors" }, status: 404
        end
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

end

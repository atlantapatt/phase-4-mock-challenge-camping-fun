class SignupsController < ApplicationController

    def create
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render_unprocessable_entity_response
        end
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_unprocessable_entity_response()
        render json: { errors: ["Validation errors"] }, status: :unprocessable_entity
      end
end

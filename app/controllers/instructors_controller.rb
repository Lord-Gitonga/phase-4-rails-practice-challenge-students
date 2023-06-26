class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    
    def index
        instructors = Instructor.all
        render json: instructors
    end

    def show
        instructors = instructor_params
        render json: instructors
    end
    
    def update
        instructors = instructor_params
        instructors.update(my_params)
        render json: instructors
    end

    def destroy
        instructors = instructor_params
        instructors.destroy
    end
    private

    def instructor_params
        Instructor.find(params[:id])
    end

    def my_params
        params.permit(:name)
    end

    def render_not_found
        render json: {error: "Not Found"}, status: :not_found
    end
end

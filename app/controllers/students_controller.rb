class StudentsController < ApplicationController
    
rescue_from ActiveRecord::RecordNotFound, with: :render_response_error  
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response
    def index
        students = Student.all
        render json: students
    end

    def show
        students = student_params
        render json: students
    end

    def update 
        students = student_params
        students.update!(my_params)
        render json: students
    end

    def destroy
        students = student_params
        students.destroy
    end

    private
    def student_params
        Student.find(params[:id])
    end

    def my_params
        params.permit(:name, :major, :age)
    end

    def render_response_error
        render json: {error: 'Student not found'}, status: :not_found
    end

    def render_record_invalid_response(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end

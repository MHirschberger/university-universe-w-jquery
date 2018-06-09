class CoursesController < ApplicationController
    def index
        @university = University.find(params[:university_id])
        @courses = @university.courses
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to course_path(@course)
        else
            redirect_to new_university_course_path
        end
    end

    def show
        @course = Course.find_by(id: params[:id])
    end

    def edit
        @course = Course.find_by(id: params[:id])
    end

    def update
        @course = Course.find_by(id: params[:id])
        if @course.update(course_params)
            redirect_to course_path(@course)
        else
            redirect_to edit_course_path
        end
    end

    def destroy
        Course.find_by(id: params[:id]).destroy
        redirect_to courses_path
    end

    def course_params
        params.require(:course).permit(:course_number, :name, :department, :university_id)
    end
        
end

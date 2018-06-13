class CoursesController < ApplicationController
    def index
        @university = University.find(params[:university_id])
        @courses = @university.courses
        if params[:search]
            @courses = @courses.search(params[:search]).order("created_at DESC")
        else
            @courses = @courses.order("created_at DESC")
        end
    end

    def new
        @university = University.find(params[:university_id])
        @course = Course.new(university_id: params[:university_id])
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
        redirect_to university_courses_path
    end

    def course_params
        params.require(:course).permit(:course_number, :name, :department, :professor, :university_id)
    end
        
end

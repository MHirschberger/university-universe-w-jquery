class CoursesController < ApplicationController
    before_action :require_login

    def index
        @university = University.find(params[:university_id])
        @courses = @university.courses
        if params[:search]
            @courses = @courses.search(params[:search]).order("name")
        else
            @courses = @courses.order("name")
        end
        render json: @courses
    end

    def new
        @university = University.find(params[:university_id])
        @course = Course.new(university_id: params[:university_id])
    end

    def create
        @university = University.find(params[:university_id])
        @course = Course.new(course_params)
        if @course.save
            redirect_to university_courses_path(@university)
        else
            render 'new'
        end
    end

    def edit
        @course = Course.find_by(id: params[:id])
        @university = @course.university
    end

    def update
        @course = Course.find_by(id: params[:id])
        if @course.update(course_params)
            redirect_to university_courses_path(@course.university)
        else
            @university = @course.university
            render 'edit'
        end
    end

    def destroy
        @course = Course.find_by(id: params[:id])
        @course.destroy
        redirect_to university_courses_path(@course.university)
    end

    private

    def course_params
        params.require(:course).permit(:course_number, :name, :department, :professor, :university_id)
    end
        
end

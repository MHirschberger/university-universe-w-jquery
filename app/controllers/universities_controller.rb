class UniversitiesController < ApplicationController

    def index
        @universities = University.all
    end

    def new
        @university = University.new
    end

    def create
        @university = University.new(university_params)
        if @university.save
            redirect_to university_path(@university)
        else
            redirect_to new_university_path
        end
    end

    def show
        @university = University.find_by(id: params[:id])
    end

    def edit
        @university = University.find_by(id: params[:id])
    end

    def update
        @university = University.find_by(id: params[:id])
        if @university.update(university_params)
            redirect_to university_path(@university)
        else
            redirect_to edit_university_path(@university)
        end
    end
    

    def university_params
        params.require(:university).permit(:name, :city, :state, :country)
    end

end

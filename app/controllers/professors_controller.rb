class ProfessorsController < ApplicationController
    def index
        @university = University.find(params[:university_id])
        @professors = @university.professors
    end

    def new
        @professor = Professor.new
    end

    def create
        @professor = Professor.new(professor_params)
        if @professor.save
            redirect_to professor_path(@professor)
        else
            redirect_to new_professor_path
        end
    end

    def show
        @professor = Professor.find_by(id: params[:id])
    end

    def edit
        @professor = Professor.find_by(id: params[:id])
    end

    def update
        @professor = Professor.find_by(id: params[:id])
        if @professor.update(professor_params)
            redirect_to professor_path(@professor)
        else
            redirect_to edit_professor_path(@professor)
        end
    end
    

    def professor_params
        params.require(:professor).permit(:name, :department)
    end
end

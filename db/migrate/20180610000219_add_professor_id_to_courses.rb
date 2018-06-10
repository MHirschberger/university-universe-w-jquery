class AddProfessorIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :professor_id, :integer
  end
end

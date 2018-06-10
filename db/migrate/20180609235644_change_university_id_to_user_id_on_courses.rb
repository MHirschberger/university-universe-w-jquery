class ChangeUniversityIdToUserIdOnCourses < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :university_id, :user_id
  end
end

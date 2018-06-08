class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :name
      t.string :department
      t.integer :university_id

      t.timestamps
    end
  end
end

class CourseSerializer < ActiveModel::Serializer
  attributes :id, :course_number, :name, :department, :professor
  belongs_to :university
end

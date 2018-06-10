class Professor < ApplicationRecord
    has_many :courses
    has_many :users, through: :courses
    belongs_to :university
end

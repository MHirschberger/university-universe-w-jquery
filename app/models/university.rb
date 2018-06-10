class University < ApplicationRecord
    has_many :professors
    has_many :courses, through: :professors
end

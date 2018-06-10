class User < ApplicationRecord
    has_many :courses
    has_many :professors, through: :courses
end

class University < ApplicationRecord
    has_many :courses

    def self.search(search)
        where("name LIKE ? OR city LIKE ? OR state LIKE ? OR country like ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
end

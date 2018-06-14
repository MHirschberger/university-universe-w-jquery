class Course < ApplicationRecord
    belongs_to :university
    has_many :posts
    has_many :users, through: :posts

    def self.search(search)
        where("course_number LIKE ? OR name LIKE ? OR department LIKE ? OR professor LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
    end

    def self.attrib(attrib)
        self.all.map(&attrib).each{ |i| i.titleize }.uniq.sort
    end
    
end

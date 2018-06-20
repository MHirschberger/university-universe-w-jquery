class Post < ApplicationRecord
    belongs_to :user
    belongs_to :course

    validates :post_type, :content, presence:true

    def last_updated
        updated_at.strftime("%a %b %e '%y at %l:%M %p")
    end

    def self.filter(post_type_value)
        where(post_type: post_type_value)
    end
end

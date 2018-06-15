class Post < ApplicationRecord
    belongs_to :user
    belongs_to :course

    def last_updated
        updated_at.strftime("%a %b %e '%y at %l:%M %p")
    end
end

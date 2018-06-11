class User < ApplicationRecord
    validates :first_name, :last_name, :email, :username, presence:true
    validates :username, :email, uniqueness: true
    has_secure_password

end

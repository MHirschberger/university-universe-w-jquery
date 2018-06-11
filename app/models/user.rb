class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, :email, :username, :password, :password_confirmation, presence:true
    validates :username, :email, uniqueness: true
end

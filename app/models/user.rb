class User < ApplicationRecord
    has_many :posts
    has_many :courses, through: :posts

    validates :name, :email, presence:true
    validates :name, :email, uniqueness: true
    
    has_secure_password(validations: false)
    validates_confirmation_of :password, :if => :password_present?
    validates_presence_of :password, :on => :create, :unless => :facebook_user?

    def password_present?
        not password.nil?
    end
    
    def facebook_user?
        not uid.nil? 
    end

end

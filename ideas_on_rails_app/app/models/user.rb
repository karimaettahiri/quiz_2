class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :ideas, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_ideas, through: :likes, source: :idea
    
end

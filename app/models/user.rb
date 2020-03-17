class User < ApplicationRecor
    has_many :works
    validates :name, :email, :password, presence: true
    validates :email , uniqueness: true
end

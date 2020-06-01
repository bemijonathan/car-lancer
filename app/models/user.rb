class User < ApplicationRecord
    has_many :works
    has_many :conversation
    validates :name, :email, :password, presence: true
    validates :email , uniqueness: true
end

class User < ApplicationRecord

    has_many :work
    
    validates :name, :email, :password, presence: true
    validates :email , uniqueness :true
    validates :password, length: {minimun: 3}
end

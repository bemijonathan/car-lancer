class Mechanic < ApplicationRecord
    has_many :biddings

    validates :password, :name, length: {minimum: 2}
    validates :email, uniqueness: true
    validates :phone, :bussinessname, :name, :password, :email, presence: true
end

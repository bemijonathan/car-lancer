class Mechanic < ApplicationRecord
    has_many :biddings
    validates :email, uniqueness: true
    validates :phone, :bussinessname, :name, :password, :email, :password, presence: true
end

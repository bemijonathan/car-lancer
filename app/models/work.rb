class Work < ApplicationRecord
    has_many :biddings
    has_many :photos
    belongs_to :user
end

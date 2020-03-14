class Work < ApplicationRecord

    has_many :bidding
    has_many :photo
    
    validates :bid, :description, presence: true
    validates :description , length: {minimun: 20}
end

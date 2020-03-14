class Bidding < ApplicationRecord
    has_many :work
    belongs_to :mechanic
    
end

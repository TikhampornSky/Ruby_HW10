class Item < ApplicationRecord
    belongs_to :user
    has_many :inventories

    #has_one_attached :picture
    has_one_attached :picture do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end
    
end

class Item < ApplicationRecord
    belongs_to :user
    has_many :inventories

    has_one_attached :picture
    # has_one_attached :picture do |attachable|     #It will make method name 'picture'
    #     attachable.variant :thumb, resize_to_fit: [10, 10]
    # end
    
end

class Product < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  
end

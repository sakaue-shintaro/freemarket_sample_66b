class Product < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  
end

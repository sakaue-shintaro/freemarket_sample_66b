class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_many :images, inverse_of: :product
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  
end

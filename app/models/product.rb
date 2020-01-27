class Product < ApplicationRecord
  has_many :images, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true  
  belongs_to :category
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  validates :seller_id, :name, :discription, :category_id, :state, :delivery_fee, :sending_method, :sending_area, :sending_day, :price, presence: true

end
class Address < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :postal_code, presence: true
  validates :prefectuer, presence: true
  validates :city_ward, presence: true
  validates :address, presence: true
end

class Card < ApplicationRecord
  belongs_to :user
  has_many :pay
end

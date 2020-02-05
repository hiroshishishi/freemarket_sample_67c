class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes dependent: :destroy
  has_many :comments dependent: :destroy
  has_many :item_image dependent: :destroy
  has_one :order
end

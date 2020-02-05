class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  has_one :order
  belongs_to_active_hash :prefecture
end

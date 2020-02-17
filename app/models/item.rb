class Item < ApplicationRecord
  # belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy, index_errors: true
  accepts_nested_attributes_for :images, allow_destroy: true
  has_one :order
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :deliveryday

  VALID_PRICEL_HALF =                 /\A[0-9]+\z/
  
  validates  :images, presence: true
  validates  :title,  presence: true, length: { maximum: 40 } 
  validates  :text,  presence: true, length: { maximum: 1000 } 
  validates  :condition_id,  presence: true
  validates  :prefecture_id,  presence: true
  validates  :fee_id,  presence: true
  validates  :deliveryday_id,  presence: true
  validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF}, numericality: { only_integer: true,
    greater_than: 300, less_than: 10000000
    }
  validates  :seller,  presence: true
end

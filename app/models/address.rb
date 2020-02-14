class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  validates :lastname, presence: true
  validates :telephone, uniqueness: true
  validates :street, presence: true
  validates :city, presence: true
  validates :prefecture_id, presence: true
  validates :zip_code, presence: true
  validates :firstname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :firstname, presence: true
end

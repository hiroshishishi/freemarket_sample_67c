class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  # validates :lastname, :firstname, :lastname_kana, :firstname_kana, :zip_code, :prefecture_id, :city, :street, presence: true
  # validates :telephone, uniqueness: true
end

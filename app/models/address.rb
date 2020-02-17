class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  # validates :lastname,
  #            format: { with: /\A[一-龥ぁ-ん]/},   presence: true
  validates :firstname,
             format: { with: /\A[一-龥ぁ-ん]/},   presence: true
  validates :lastname_kana,
             format: { with: /\A[ァ-ヶー－]+\z/}, presence: true
  validates :firstname_kana,
             format: { with: /\A[ァ-ヶー－]+\z/}, presence: true
  validates :zip_code,      presence: true
  validates :prefecture_id, presence: true
  validates :city,          presence: true
  validates :street,        presence: true
  validates :user,       presence: true
end

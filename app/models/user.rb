class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :authentication_keys => [:login]
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :items
  has_many :likes, dependent: :destroy
  has_many :wallets, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :social_providers, dependent: :destroy
  
  has_one :address, dependent: :destroy
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"


  validates :nickname,      presence: true
  validates :lastname,      presence: true,
             format: { with: /\A[一-龥ぁ-ん]/}
  validates :firstname,     presence: true,
             format: { with: /\A[一-龥ぁ-ん]/}
  validates :lastname_kana, presence: true,
             format: { with: /\A[ァ-ヶー－]+\z/}
  validates :firstname_kana, presence: true,
             format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_year,  presence: true
  validates :birth_month, presence: true
  validates :birth_day,   presence: true
  validates :email,       uniqueness: true, presence: true
  validates :password,    length: { minimum: 7 },presence: true ,confirmation: true
  validates :password_confirmation, presence: true
  validates :telephone,  uniqueness: true, presence: true

end
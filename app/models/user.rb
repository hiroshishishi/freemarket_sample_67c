class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :authentication_keys => [:login]
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  has_many :items
  has_many :likes, dependent: :destroy
  has_many :wallets, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :social_providers, dependent: :destroy
  has_one :address, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates :telephone, uniqueness: true
  validates :password, presence: true
  validates :nickname, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
end
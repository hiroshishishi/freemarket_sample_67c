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
  validate :email, uniqueness: true, presence: true
  validate :telephone, uniqueness: true
  validate :password, presence: true
  validate :nickname, presence: true
  validate :lastname, presence: true
  validate :firstname, presence: true
  validate :lastname_kana, presence: true
  validate :firstname_kana, presence: true
  validate :birth_year, presence: true
  validate :birth_month, presence: true
  validate :birth_day, presence: true
end
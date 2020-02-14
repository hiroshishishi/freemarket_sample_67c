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
  # validate :nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birth_year, :birth_month, :birth_day, :password, presence: true
  # validate :email, uniqueness: true, presence: true
  # validate :telephone, uniqueness: true
end
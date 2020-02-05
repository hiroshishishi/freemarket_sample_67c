class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :items
  has_many :likes, dependent: :destroy
  has_many :wallets, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :social_providers, dependent: :destroy
  has_one :delivery_addresses, dependent: :destroy
end
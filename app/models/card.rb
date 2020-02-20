class Card < ApplicationRecord
  belongs_to :user

  validates  :user_id, presence: true
  validates  :customert_id, presence: true
  validates  :card_id, presence: true
end

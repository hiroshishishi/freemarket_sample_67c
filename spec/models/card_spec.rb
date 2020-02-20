require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe Card do
    describe '#create' do      
      # 1. titleが空では登録できないこと
      it "is invalid without a user_id" do
        card = build(:Card, user_id: nil)
        card.valid?
        expect(card.errors[:user_id]).to include("can't be blank")
      end

      it "is invalid without a customer_id" do
        card = build(:Card, customer_id: nil)
        card.valid?
        expect(card.errors[:customer_id]).to include("can't be blank")
      end

      it "is invalid without a card_id" do
        card = build(:Card, card_id: nil)
        card.valid?
        expect(card.errors[:cars_id]).to include("can't be blank")
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    describe '#create' do      
      # 1. titleが空では登録できないこと
      it "is invalid without a title" do
        item = build(:item, title: nil)
        item.valid?
        expect(item.errors[:title]).to include("can't be blank")
      end

      # 2. titleが41文字以上であれば登録できないこと
      it "is invalid with a title that has more than 41 characters " do
        title = "a" * 41
        item = build(:item, title: title)
        item.valid?
        expect(item.errors[:title]).to include("is too long (maximum is 40 characters)")
      end

      # 3. textが空では登録できないこと
      it "is invalid without a text" do
        item = build(:item, text: nil)
        item.valid?
        expect(item.errors[:text]).to include("can't be blank")
      end

      # 4. textが1001文字以上であれば登録できないこと
      it "is invalid with a text that has more than 1001 characters " do
        text = "a" * 1001
        item = build(:item, text: text)
        item.valid?
        expect(item.errors[:text]).to include("is too long (maximum is 1000 characters)")
      end

      # 5. categoryが空では登録できないこと
      it "is invalid without a category_id" do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category]).to include("must exist")
      end

      # 6. condition_idが空では登録できないこと
      it "is invalid without a condition_id" do
        item = build(:item, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include("can't be blank")
      end

      # 7. fee_idが空では登録できないこと
      it "is invalid without a fee_id" do
        item = build(:item, fee_id: nil)
        item.valid?
        expect(item.errors[:fee_id]).to include("can't be blank")
      end

      # 8. prefecture_idが空では登録できないこと
      it "is invalid without a prefecture_id" do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("can't be blank")
      end

      # 9. deliveryday_idが空では登録できないこと
      it "is invalid without a deliveryday_id" do
        item = build(:item, deliveryday_id: nil)
        item.valid?
        expect(item.errors[:deliveryday_id]).to include("can't be blank")
      end

      # 10. priceが空では登録できないこと
      it "is invalid without a price" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      # 11. priceが299では登録できないこと
      it "is invalid with a price that have 299" do
        price = 299
        item = build(:item, price: price)
        item.valid?
        expect(item.errors[:price]).to include("must be greater than 300")
      end

      # 12. priceが10,000,000では登録できないこと
      it "is invalid with a price that have 10,000,000" do
        price = 10000000
        item = build(:item, price: price)
        item.valid?
        expect(item.errors[:price]).to include("must be less than 10000000")
      end

      # 13. seller_idが空では登録できないこと
      it "is invalid without a seller_user" do
        item = build(:item, seller_id: nil)
        item.valid?
        expect(item.errors[:seller]).to include("must exist")
      end
    end
  end
end
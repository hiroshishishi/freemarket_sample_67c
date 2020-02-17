require 'rails_helper'

RSpec.describe Address, type: :model do
  describe Address do
    describe '#create' do      

      # 1. lastnameが空では登録できないこと
      it "is invalid without a lastname" do
        address = build(:address, lastname: nil)
        address.valid?
        expect(address.errors[:lastname]).to include("can't be blank")
      end

      # 2. firstnameが空では登録できないこと
      it "is invalid without a firstname" do
        address = build(:address, firstname: nil)
        address.valid?
        expect(address.errors[:firstname]).to include("can't be blank")
      end

      # 3. lastname_kanaが空では登録できないこと
      it "is invalid without a lastname_kana" do
        address = build(:address, lastname_kana: nil)
        address.valid?
        expect(address.errors[:lastname_kana]).to include("can't be blank")
      end

      # 4. firstname_kanaが空では登録できないこと
      it "is invalid without a firstname_kana" do
        address = build(:address, firstname_kana: nil)
        address.valid?
        expect(address.errors[:firstname_kana]).to include("can't be blank")
      end

      # 5. katakanaだと登録できる
      it "is valid with a lastname_kana that katakana " do
        address = build(:address, lastname_kana: "ア")
        address.valid?
        expect(address).to be_valid
      end

      # 6. katakanaだと登録できる
      it "is valid with a firstname_kana that katakana " do
        address = build(:address, firstname_kana: "ア")
        address.valid?
        expect(address).to be_valid
      end

      # 7. zip_codeが空では登録できないこと
      it "is invalid without a zip_code" do
        address = build(:address, zip_code: nil)
        address.valid?
        expect(address.errors[:zip_code]).to include("can't be blank")
      end

      # 8. prefecture_idが空では登録できないこと
      it "is invalid without a prefecture_id" do
        address = build(:address, prefecture_id: nil)
        address.valid?
        expect(address.errors[:prefecture_id]).to include("can't be blank")
      end

      # 9. cityが空では登録できないこと
      it "is invalid without a city" do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("can't be blank")
      end

      # 10. streetが空では登録できないこと
      it "is invalid without a street" do
        address = build(:address, street: nil)
        address.valid?
        expect(address.errors[:street]).to include("can't be blank")
      end
      # 11. user_idが空では登録できないこと
      it "is invalid without a user_id" do
        address = build(:address, user_id: nil)
        address.valid?
        expect(address.errors[:user_id]).to include("can't be blank")
      end
    end
  end
end
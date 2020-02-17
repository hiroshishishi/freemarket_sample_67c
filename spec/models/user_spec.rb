require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe '#create' do      
      # 1. nicknameが空では登録できないこと
      it "is invalid without a nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      # 2. lastnameが空では登録できないこと
      it "is invalid without a lastname" do
        user = build(:user, lastname: nil)
        user.valid?
        expect(user.errors[:lastname]).to include("can't be blank")
      end

      # 3. firstnameが空では登録できないこと
      it "is invalid without a firstname" do
        user = build(:user, firstname: nil)
        user.valid?
        expect(user.errors[:firstname]).to include("can't be blank")
      end

      # 4. lastname_kanaが空では登録できないこと
      it "is invalid without a lastname_kana" do
        user = build(:user, lastname_kana: nil)
        user.valid?
        expect(user.errors[:lastname_kana]).to include("can't be blank")
      end

      # 5. firstname_kanaが空では登録できないこと
      it "is invalid without a firstname_kana" do
        user = build(:user, firstname_kana: nil)
        user.valid?
        expect(user.errors[:firstname_kana]).to include("can't be blank")
      end

      # 6. katakanaだと登録できる
      it "is valid with a lastname_kana that katakana " do
        user = build(:user, lastname_kana: "ア")
        user.valid?
        expect(user).to be_valid
      end

      # 7. katakanaだと登録できる
      it "is valid with a firstname_kana that katakana " do
        user = build(:user, firstname_kana: "ア")
        user.valid?
        expect(user).to be_valid
      end

      # 8. birth_yearが空では登録できないこと
      it "is invalid without a birth_year" do
        user = build(:user, birth_year: nil)
        user.valid?
        expect(user.errors[:birth_year]).to include("can't be blank")
      end

      # 9. birth_monthが空では登録できないこと
      it "is invalid without a birth_month" do
        user = build(:user, birth_month: nil)
        user.valid?
        expect(user.errors[:birth_month]).to include("can't be blank")
      end

      # 10. birth_dayが空では登録できないこと
      it "is invalid without a birth_day" do
        user = build(:user, birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include("can't be blank")
      end

      # 11. emailが空では登録できないこと
      it "is invalid without a email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      # 12. 重複したemailが存在する場合登録できないこと
      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      # 13. passwordが7文字以上であれば登録できること
      it "is valid with a password that has more than 7 characters " do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        user.valid?
        expect(user).to be_valid
      end

      # 14. passwordが6文字以下であれば登録できないこと
      it "is invalid with a password that has less than 6 characters " do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
      end
      # 15. passwordが存在してもpassword_confirmationが空では登録できないこと
      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      # 16. 重複したtelephoneが存在する場合登録できないこと
      it "is invalid with a duplicate telephone user" do
        user = create(:user)
        another_user = build(:user, telephone: user.telephone)
        another_user.valid?
        expect(another_user.errors[:telephone]).to include("has already been taken")
      end
      # 17. @なしでは登録できない
      it "is invalid without a @" do
        user = build(:user, email: "aaa@aaa.aa")
        user.valid?
        expect(user.errors[:email][0]).to include("Unable to register without ＠")
      end
    end
  end
end
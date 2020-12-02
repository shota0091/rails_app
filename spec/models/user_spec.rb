require 'rails_helper'
describe User do
  describe '#create' do
    #１、全て存在する時登録できる
    it "is valid with a name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    #2.nameがからの場合登録できない
    it "is invalid without a name" do
      user = build(:user, user: nil)
      user.valid?
      expect(user.errors[:user]).to includ("can't be blank")
    end

    #3.emailが空で登録できない
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to includ("can't be blank")
    end

    #4.passwordが空で登録できない
    it "is invalid without a password" do
      user = build(:user,  password: nil)
      user.valid?
      expect(user.errors[:password]).to includ("can't be blank")
    end

    #5.passwordがあってもpassword_confirmationが空では登録できない
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user,  password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to includ("can't be blank")
    end

    # 6. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 7. passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    # 8. passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
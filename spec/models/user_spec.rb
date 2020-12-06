require 'rails_helper'
describe User do
  describe '#create' do

    it "全てが存在できれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームがない場合登録できない" do
      user = build(:user, user: nil)
      user.valid?
      expect(user.errors[:user]).to includ("can't be blank")
    end

    it "メールアドレスがからの場合登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to includ("can't be blank")
    end

    it "パスワードが空だと登録できない" do
      user = build(:user,  password: nil)
      user.valid?
      expect(user.errors[:password]).to includ("can't be blank")
    end

    it "パスワードがあっても確認用のパスワードが空だと登録できない" do
      user = build(:user,  password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to includ("can't be blank")
    end

    it "メールアドレスがすでに存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "パスワードが６文字以上で登録できる" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it "パスワードが５文字以下なら登録できない" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
require 'rails_helper'
describe User do
  describe '#create' do

    it "全てが存在できれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームがない場合登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスがからの場合登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードが空だと登録できない" do
      user = build(:user,  password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードがあっても確認用のパスワードが空だと登録できない" do
      user = build(:user,  password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "メールアドレスがすでに存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードが６文字以上で登録できる" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it "パスワードが５文字以下なら登録できない" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end

    describe '#update' do
      it "変更可能な項目があれば登録できる" do
        user = build(:user)
        expect(user).to be_valid
    end

    it "ニックネームがない場合登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  end
end
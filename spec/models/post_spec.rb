require 'rails_helper'
describe Post do
  describe '#create' do
    it "全てが存在できれば登録できる" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "動画が空だと登録できない" do
      post = build(:post, video: "")
      post.valid?
      expect(post.errors[:video]).to include("を投稿してください")
    end

    it "動画タイトルが空だと登録できない" do
      post = build(:post, title: "")
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "動画内容が空だと登録できない" do
      post = build(:post, body: "")
      post.valid?
      expect(post.errors[:body]).to include("を入力してください")
    end
  end

  describe '#updata' do
    it "全てが存在できれば登録できる" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "動画タイトルが空だと登録できない" do
      post = build(:post, title: "")
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "動画内容が空だと登録できない" do
      post = build(:post, body: "")
      post.valid?
      expect(post.errors[:body]).to include("を入力してください")
    end
  end
end
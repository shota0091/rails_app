class Post < ApplicationRecord
  validates :video, presence: { message: 'を投稿してください' }
  validates :title, presence: true
  validates :body, presence: true
  mount_uploader :video, VideoUploader

  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :lists,dependent: :destroy
  is_impressionable



  def self.search(search)
    if search != ""
      Post.where('body LIKE(?) or title LIKE(?)', "%#{search}%","%#{search}%")
    else
      Post.all
    end
  end
end
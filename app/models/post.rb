class Post < ApplicationRecord
  validates :video, presence: true
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

    def self.sort(selection)
      case select
      when 'new'
        return all.order(created_at: :DESC)
      when 'old'
        return all.order(created_at: :ASC)
      when 'likes'
        return find(Like.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
      when 'dislikes'
        return find(Like.group(:post_id).order(Arel.sql('count(post_id) asc')).pluck(:post_id))
      end
    end
  end
end
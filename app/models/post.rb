class Post < ApplicationRecord
  validates :video, presence: true
  mount_uploader :video, VideoUploader

  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :lists,dependent: :destroy
end
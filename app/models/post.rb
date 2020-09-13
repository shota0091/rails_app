class Post < ApplicationRecord
  validates :video, presence: true
  mount_uploader :video, VideoUploader

  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
end
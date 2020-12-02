class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader
  has_many :posts,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :lists,dependent: :destroy

  
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def already_list?(post)
    self.lists.exists?(post_id: post.id)
  end

  def self.guest
    find_or_create_by!(name: 'ゲスト',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end

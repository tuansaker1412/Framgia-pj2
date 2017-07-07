class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy

  scope :sort_feed, ->{order created_at: :desc}

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  mount_uploader :picture, PictureUploader
end

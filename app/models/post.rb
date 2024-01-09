class Post < ApplicationRecord


  belongs_to :user
  has_one_attached :post_image
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy


def favorited_by?(user)
    favorites.exists?(user_id: user.id)
end

def get_post_image(width, height)
  post_image.variant(resize_to_limit: [width, height]).processed
end
end

class Post < ApplicationRecord

has_one_attached :post_image

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy


def favorited_by?(user)
    favorites.exists?(user_id: user.id)
end

def get_post_image(width, height)
  post_image.variant(resize_to_limit: [width, height]).processed
end

#検索機能の記述
 def self.search_for(content, method)
    if method == 'perfect'
      Post.where(caption: content)
    elsif method == 'partial'
      Post.where('caption LIKE ?', '%'+content+'%')
    end
 end

end

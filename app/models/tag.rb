class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts, through: :post_tags

  scope :merge_posts, -> (tags) { }

  def self.search_posts_for(content, method)
    if method == 'perfect'
      tags = Tag.where(name: content)
    elsif method == 'partial'
      tags = Tag.where('name LIKE ?', '%' + content + '%')
    end
    return tags.map(&:posts).flatten.sort_by(&:created_at).reverse
  end
end

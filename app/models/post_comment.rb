class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post

def self.search_comments_for(content, method)

    if method == 'perfect'
      PostComment.where(comment: content)
      #:nameはタグテーブルで保存されているカラム。
    elsif method == 'partial'
      PostComment.where('comment LIKE ?', '%'+content+'%')
    end

end

end


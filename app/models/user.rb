class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :posts
has_one_attached :profile_image
  # has_many :post_comments, dependent: :destroy

end

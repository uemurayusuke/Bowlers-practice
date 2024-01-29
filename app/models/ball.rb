class Ball < ApplicationRecord

  has_one_attached :ball_image

   belongs_to :user

def get_ball_image(width, height)
    ball_image.variant(resize_to_limit: [width, height]).processed
end

end

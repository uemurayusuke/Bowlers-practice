class UserRoom < ApplicationRecord

  belongs_to :user
  belongs_to :room

end

#user_roomがentry。entryは日本語で入口
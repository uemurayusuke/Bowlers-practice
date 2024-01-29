hitosi = User.find_or_create_by!(email: "hitosi@test.com") do |user|
  user.last_name = "滝川"
  user.first_name = "仁"
  user.last_name_kana = "タキガワ"
  user.first_name_kana = "ヒトシ"
  user.user_name = "hitosi"
  user.introduction = "よろしく"
  user.password = "hitosi"
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/profile_image/bowling_user_boy1.jpg"), filename: "bowling_user_boy1.jpg")
end

Post.find_or_create_by!(caption: "投げに来ました！") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/post_image/bowling_pin.jpg"), filename: "bowling_pin.jpg")
  post.user = hitosi

  # タグの追加
    tag = Tag.find_or_create_by(name: "ボウリング")
    post.tags << tag
  end


5.times do |n|
  User.create!(
    last_name: "試験#{n + 1}",
    first_name: "太郎#{n + 1}",
    last_name_kana: "テスト#{n + 1}",
    first_name_kana: "タロウ#{n + 1}",
    email: "test#{n + 1}@test.com",
    user_name: "taro#{n + 1}",
    introduction: "よろしく#{n + 1}",
    password: "123456",
    is_active: true  # 修正: true は文字列ではなく、真偽値として設定
  )
end

Admin.create!(
  email: "bowlers@gmail.com",
  password: "bowlers202311"
)



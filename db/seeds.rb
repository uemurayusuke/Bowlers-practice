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
    is_active: "true"
  )
end


Admin.create!(
    email: "bowlers@gmail.com",
    password: "bowlers202311"
  )
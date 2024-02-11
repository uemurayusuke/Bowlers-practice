FactoryBot.define do
  factory :user do

    user_name { Faker::Lorem.characters(number: 10) }
    last_name { Faker::Lorem.characters(number: 5) }
    first_name { Faker::Lorem.characters(number: 5) }
    last_name_kana { Faker::Lorem.characters(number: 5) }
    first_name_kana { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }


    after(:build) do |user|
      user.profile_image.attach(io: File.open('spec/images/profile_image.jpeg'), filename: 'profile_image.jpeg', content_type: 'image/jpeg')
    end
  end
end
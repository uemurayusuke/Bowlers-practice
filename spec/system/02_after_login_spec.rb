require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '新規投稿画面のテスト' do
    before do
      visit new_post_path
    end

    context '投稿成功のテスト' do
      before do
        attach_file('post[post_image]', Rails.root.join('spec', 'images', 'profile_image.jpeg'))
        fill_in 'post[caption]', with: Faker::Lorem.characters(number: 20)
        fill_in 'post[tag_name]', with: Faker::Lorem.characters(number: 5)
      end

      it '自分の新しい投稿が正しく保存される' do
        expect { click_button '投稿する' }.to change(user.posts, :count).by(1)
      end

      it 'リダイレクト先が、投稿したユーザー詳細画面になっている' do
        click_button '投稿する'
        expect(response).to redirect_to(user_path(user))
      end
    end
  end

  describe '自分のユーザ情報編集画面のテスト' do
    before do
      visit edit_user_path(user)
    end

    context '更新成功のテスト' do
      before do
        @user_old_user_name = user.user_name
        @user_old_introduction = user.introduction
        @user_old_profile_image = user.profile_image
        attach_file('post[post_image]', Rails.root.join('spec', 'images', 'profile_image.jpeg'))
        fill_in 'user[user_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 10)
        click_button '変更内容を保存'
      end

      it 'プロフィール画像が正しく更新される' do
        expect(user.reload.profile_image).not_to eq @user_old_profile_image
      end

      it 'ユーザー名が正しく更新される' do
        expect(user.reload.user_name).not_to eq @user_old_user_name
      end

      it '自己紹介文が正しく更新される' do
        expect(user.reload.introduction).not_to eq @user_old_introduction
      end

      it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end
  end
end
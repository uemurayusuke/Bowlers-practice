# require 'rails_helper'

# describe '[STEP3] 仕上げのテスト' do
#   let(:user) { create(:user) }
#   let!(:other_user) { create(:user) }
#   let!(:book) { create(:book, user: user) }
#   let!(:other_book) { create(:book, user: other_user) }

#   describe 'ログインしていない場合のアクセス制限のテスト: アクセスできず、ログイン画面に遷移する' do
#     subject { current_path }

#     it 'ユーザ一覧画面' do
#       visit users_path
#       is_expected.to eq '/users/sign_in'
#     end
#     it 'ユーザ詳細画面' do
#       visit user_path(user)
#       is_expected.to eq '/users/sign_in'
#     end
#     it 'ユーザ情報編集画面' do
#       visit edit_user_path(user)
#       is_expected.to eq '/users/sign_in'
#     end
#     it '投稿一覧画面' do
#       visit books_path
#       is_expected.to eq '/users/sign_in'
#     end
#     it '投稿詳細画面' do
#       visit book_path(book)
#       is_expected.to eq '/users/sign_in'
#     end
#     it '投稿編集画面' do
#       visit edit_book_path(book)
#       is_expected.to eq '/users/sign_in'
#     end
#   end

# end

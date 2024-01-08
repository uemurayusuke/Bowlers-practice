Rails.application.routes.draw do

  namespace :public do
    get 'posts/new'
    get 'posts/create'
    get 'posts/index'
    get 'posts/destroy'
    get 'posts/show'
  end
  get 'relationships/create'
  get 'relationships/destroy'
  get 'post_comments/create'
  get 'post_comments/destroy'
  namespace :public do
    get 'favorites/destroy'
    get 'favorites/create'
  end
  #ユーザー認証関係
  devise_scope :user do
  root to: 'public/sessions#new'
  end
  # コントローラとアクションは後で確認する

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#管理者側
namespace :admin do
  resources :users, only:[:index, :show, :edit, :update]
  end

#ユーザー側
   scope module: :public do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :users, only: [:show, :edit, :update, :destroy] do
      collection do
        get :unsubscribe
        #ユーザーの退会確認画面
        patch :withdraw
        #ユーザーの退会処理(ステータス更新)
      end
    end
  end
end


#管理者側とユーザー側を入れ替えたら、ルーティングエラーが無くなった。なぜ？
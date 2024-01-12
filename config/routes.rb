Rails.application.routes.draw do

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
    resources :posts, only: [:new, :create, :index, :destroy, :show] do
     resources :post_comments, only: [:create, :destroy]
     resource :favorite, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update, :destroy, :index] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      collection do
        get :unsubscribe
        #ユーザーの退会確認画面
        patch :withdraw
        #ユーザーの退会処理(ステータス更新)
      end
    end
    get '/search', to: 'searches#search'
    resources :chats, only: [:show, :create]
  end
end


#管理者側とユーザー側を入れ替えたら、ルーティングエラーが無くなった。なぜ？
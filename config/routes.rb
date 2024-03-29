Rails.application.routes.draw do


  # ユーザー認証関係
  devise_scope :user do
    root to: 'homes#top'
    # ゲストログインに関する記述
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  # コントローラとアクションは後で確認する
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 管理者側
  namespace :admin do
    delete "posts/destroy_all"
    get '/search', to: 'searches#search'
    resources :users, only:[:index, :show, :edit, :update] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts, only:[:index, :show, :destroy]
    resources :post_comments, only:[:index, :destroy]
  end

  # ユーザー側
  scope module: :public do
    delete 'posts/destroy_all' => 'posts#destroy_all', as: 'destroy_all_posts'
    get 'posts/destroy' => 'posts#destroy_posts' , as: 'destroy_posts'
    resources :posts, only: [:new, :create, :index, :destroy, :show] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update, :destroy, :index] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :favorites
        get :following, :followers, :users_posts
      end
      collection do
        # ユーザーの退会確認画面
        get :unsubscribe
        # ユーザーの退会処理(ステータス更新)
        patch :withdraw
        get "/:id/following_posts/" => "users#following_posts", as: 'following_posts'
      end
    end
    get '/search', to: 'searches#search'
    resources :chats, only: [:show, :create]
  end
  end

# 整理完了
Rails.application.routes.draw do

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
end
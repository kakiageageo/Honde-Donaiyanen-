Rails.application.routes.draw do


  root to: "public/homes#top"
  get 'home/about' => 'public/homes#about'

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #ゲストログイン用
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  scope module: :public do
    patch "users/withdraw", to: "users#withdraw"
    get "books/search", to: "searches#book_search"
    get "books/genre_search", to: "searches#book_genre_search"
    get "genres/search", to: "searches#genre_search"
    resources :users, only: [:show, :edit, :update]
    resources :books, only: [:index, :show, :new, :create, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resource :dislikes, only: [:create, :destroy]
      resource :requests, only: [:create, :destroy]
    end
    resources :genres
  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get 'admin/home' => 'admin/homes#top'

  namespace :admin do
    resources :users, only: [:index, :show, :update]
    resources :books, only: [:index, :destroy]
    resources :genres, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

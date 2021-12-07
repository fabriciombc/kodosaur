Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "achievement", to: "pages#achievement", as: :achievement
  get "friends", to: "pages#friends", as: :friends

  resources :challenges, shallow: true do
    resources :games, only: %i[create show]
  end
  resources :games, only: [:update]
end

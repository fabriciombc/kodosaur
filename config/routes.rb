Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "achievement", to: "pages#achievement", as: :achievement

  resources :challenges, shallow: true do
    resources :games, only: %i[create show]
  end
end

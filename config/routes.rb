Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :challenges, shallow: true do
    resources :games, only: %i[create show]
  end
end

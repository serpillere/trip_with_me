Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages#home'
  resources :visits do
    resources :bookings, only: [:new, :create, :index]
  end
  get 'dashboard', to: 'pages#dashboard'
  get 'profile', to: "pages#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

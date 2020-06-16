Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages#home'
  resources :visits do
    post 'bookings', to: 'bookings#create' 
    post 'reviews', to: 'reviews#create'
    resources :bookings, only: [:index]
    #get "visits/reviews" => "reviews#show"
    
  end
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

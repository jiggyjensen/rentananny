Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :nannies, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index] do
    resources :reviews, only: :create
    member do
      patch '/accept', to: 'bookings#accept'
      patch '/reject', to: 'bookings#reject'
    end
  end # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

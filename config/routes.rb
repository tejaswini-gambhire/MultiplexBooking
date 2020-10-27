Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :movies do
    member do
      get :shows
    end
  end

  resources :shows do
    member do
      get :seats
    end
  end

  resources :bookings, only: [:index, :create, :show] do
    collection do
      get :my_bookings
    end
  end
end

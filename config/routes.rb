Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
      resources :posts, only: [:new, :create, :show, :index] do
        resources :replies, only: [:create]
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :home, only: [:index]
end

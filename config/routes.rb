Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  resources :addresses do
    collection { post :import }
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    get 'users', to: 'users/sessions#index'
    get 'users/superuser', to: 'users/sessions#superuser'
    get 'users/:identifier/edit', to: 'users/sessions#edit'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"

end

Rails.application.routes.draw do

  root 'application#home'
  resources :universities do
    resources :courses, only: [:index, :new, :create]
  end

  resources :courses, only: [:show, :edit, :update, :destroy]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

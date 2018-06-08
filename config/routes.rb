Rails.application.routes.draw do
  resources :courses
  resources :universities
  root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

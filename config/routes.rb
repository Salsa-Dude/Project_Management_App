Rails.application.routes.draw do
  resources :tasks
  resources :notes
  resources :projects
  resources :collaborators
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :HiBeth
end

Rails.application.routes.draw do
  resources :benefits
  resources :obras
  resources :logas
  resources :epcformularies
  resources :asformularies
  resources :aspcategories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

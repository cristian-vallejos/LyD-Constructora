Rails.application.routes.draw do

  devise_for :lydusers
  get '/ld/index', to: 'ld#index'
  root to: 'ld#index'
  get 'asformularies/newseg', to: 'asformularies#newseg', as: 'newseg'


  resources :benefits
  resources :obras
  resources :logas
  resources :epcformularies
  resources :asformularies
  resources :aspcategories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

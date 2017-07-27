Rails.application.routes.draw do

  resources :employees
  resources :assignbenefits
  resources :areabenefits
  resources :loanformularies do
    member do
      get :accept
      get :refuse
      get :filtrar
    end
  end


  devise_for :lydusers
  get '/ld/index', to: 'ld#index'
  root to: 'ld#index'
  #get 'asformularies/newseg', to: 'asformularies#newseg', as: 'newseg'


  resources :benefits
  resources :obras
  resources :logas
  resources :epcformularies
  resources :asformularies do
    member do
      get :newseg
      get :checkrut
    end
  end
  resources :aspcategories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

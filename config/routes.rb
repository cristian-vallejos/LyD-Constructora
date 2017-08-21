Rails.application.routes.draw do

  resources :familiartrabajadors
  resources :asignarmultiplebeneficios do
    collection do
      get 'get_contacts', to: "asignarmultiplebeneficios#get_contacts"
    end

    collection do
      get 'get_trabajadorporobra', to: "asignarmultiplebeneficios#get_trabajadorporobra"
    end
  end
  
  resources :logloans
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
  get 'ld/crudpannel', to: 'ld#crudpannel'
  get 'ld/beneficiospannel', to: 'ld#beneficiospannel'
  get 'ld/reportspannel', to: 'ld#reportspannel'
  get 'ld/userspannel', to: 'ld#userspannel'
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
    collection do
      get 'search', to: "asformularies#search"
    end
  end
  resources :aspcategories
  resources :users

  resources :pages do
    get :download_pdf
  end


  get '/benefitPanel' => 'pages#benefitPanel' 
  post '/benefitPanel' => 'pages#indexBenefitPerName'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

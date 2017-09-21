Rails.application.routes.draw do

  resources :logbenefitsfinalsdo do
     collection do
       post 'saveLogFinal', to: "logbenefitsfinals#saveLogFinal"
     end
   end
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
  resources :areabenefits do
    member do
      get :is_active
    end
  end
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
  get 'ld/download_pdf', to: 'ld#download_pdf'
  root to: 'ld#index'
  #get 'asformularies/newseg', to: 'asformularies#newseg', as: 'newseg'


  resources :benefits do 
    member do
      get :is_active
    end
  end
  
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
      get 'get_benefits', to: "asformularies#get_benefits"
    end
  end

  resources :aspcategories do
    member do
      get :is_active
    end
  end

  resources :users

  resources :pages do
    get :download_pdf
  end


  get '/benefitPanel', to: 'pages#benefitPanel' 
  #post '/benefitPanel' => 'pages#indexBenefitPerName'
  post '/logBeneficiosCheckAsistencia', to: 'pages#logBeneficiosCheckAsistencia' 
  post '/indexBenefitPerName', to: 'pages#indexBenefitPerName'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

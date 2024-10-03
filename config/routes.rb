Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # method 1
  # get 'dashboard/index'

  # method 2 
  # resources :users
  root 'users#registration'
  get '/dashboard' =>'dashboard#index'
  get '/dashboard/analytics' => 'dashboard#analytics'
  get '/dashboard/scheduled_appointments' => 'dashboard#scheduled_appointments'

  post '/show' => 'users#create'
  # get '/login', to: 'sessions#new'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
  
  post '/appointment' => 'appointments#index'
  get '/appointment/create' => 'appointments#create'
  post '/appointment/all' => 'appointments#new'
  get '/appointment/show' => 'appointments#show'
  post '/appointment/update' => 'appointments#update'
  get '/appointment/edit' => 'appointments#edit'
  get '/appointment/delete' => 'appointments#delete'
  get '/appointment/update_status' => 'appointments#update_status'

  get '/user' => 'users#index'
  get '/user/new' => 'users#new'
  get '/user/edit' => 'users#edit'
  post '/user/update' => 'users#update'
  
end

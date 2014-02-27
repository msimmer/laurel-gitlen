Gallery::Application.routes.draw do
  
  match 'admin/login' => 'admin/sessions#new', via: :get, :as => :login   
  match 'admin/logout' => 'admin/sessions#destroy', via: :get, :as => :logout    
  
  namespace :admin do
    resources :sessions, only: :create
    resources :stories

    resources :exhibitions do
      post 'aws_callback', on: :member
      post 'press_release_callback', on: :member 
      get 'delete', on: :member
      
      resources :displays
      resources :orders
    end

    resources :artists do
      post 'aws_callback', on: :member
      post 'cv_callback', on: :member
      post 'press_callback', on: :member
      resources :works
      resources :orders
    end
    
  end
  
  resources :exhibitions, :artists
  root 'static#splash'
  get 'splash' => 'static#splash'
  get 'contact' => 'static#contact'
  get 'news' => 'static#news'
  get 'archives' => 'static#archives'
  
  get '*path' => redirect('/')
end

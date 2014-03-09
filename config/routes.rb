Gallery::Application.routes.draw do
  
  match 'admin/login' => 'admin/sessions#new', via: :get, :as => :login   
  match 'admin/logout' => 'admin/sessions#destroy', via: :get, :as => :logout    
  
  namespace :admin do
    resources :sessions, only: :create
    
    resources :stories do
      post 'aws_callback', on: :collection
    end

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
  
  get 'news' => 'stories#index'
  get 'story/:id' => 'stories#show'
  
  get 'splash' => 'static#splash'
  get 'contact' => 'static#contact'
  get 'archives' => 'static#archives'
  
  root 'static#splash'
  get '*path' => redirect('/')
end

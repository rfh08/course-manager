Rails.application.routes.draw do
  get 'posts/new'
  
  get 'locations/new'

  get 'categories/new'

  get 'sessions/new'
  
  get 'sessions/adminnew'

  get 'users/new'
  
  get 'courses/new'

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/newcate',  to: 'categories#new'
  post '/newcate',  to: 'categories#create'
  get  '/newloca',  to: 'locations#new'
  post '/newloca',  to: 'locations#create'
  get  '/newcourse',  to: 'courses#new'
  post '/newcourse',  to: 'courses#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  post '/postup',  to: 'posts#create' 
  get    '/adminlogin',   to: 'sessions#adminnew'
  post   '/adminlogin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :courses
  resources :users
  resources :categories
  resources :posts
  resources :locations
  
post '/likes' => 'votes#create', as: :like_create
post '/dislikes' => 'votes#dislike', as: :dislike_create
post '/reset' => 'votes#reset', as: :reset_vote
  
get ':status', to: 'errors#show'
end
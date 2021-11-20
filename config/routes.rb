Rails.application.routes.draw do
  get '/' => 'users#index'
  get '/access' => 'users#access'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  resources :users
end

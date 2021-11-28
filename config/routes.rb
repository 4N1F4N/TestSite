Rails.application.routes.draw do
  get '/' => 'users#index'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  resources :users
  get '*path', to: 'errors#error_404', via: :all
end

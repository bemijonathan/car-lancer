Rails.application.routes.draw do
  get '/' => "application#index"
  get '/about' => "application#about"
  # resources "bidding"
  get 'login' => "application#login"
  get 'logout' => "application#logout"
  get 'signup' => "application#signup"
  post 'search' => "application#search"
  get 'search' => "application#search"
  post 'user/login' => "user#login"
  post 'mechanic/login' => "mechanic#login"
  resources :user
  resources :mechanic
  resources :job
  get 'alljobs' => "job#all"
  get 'dashboard' => "dashboard#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

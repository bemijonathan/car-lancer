Rails.application.routes.draw do
  get '/' => "application#index"
  get '/about' => "application#about"
  # resources "bidding"
  get 'login' => "application#login"
  get 'user/login' => "user#login"
  get 'mechanic/login' => "mechanic#login"
  get 'logout' => "application#logout"
  get 'signup' => "application#signup"
  post 'search' => "application#search"
  get 'search' => "application#search"
  post 'user/signin' => "user#signin"
  post 'mechanic/signin' => "mechanic#signin"
  resources :message
  resources :user
  resources :mechanic
  resources :job
  post "newbid/:id" => "job#newbid"
  get 'myposts' => "job#mypost"
  get 'alljobs' => "job#all"
  get 'dashboard' => "dashboard#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

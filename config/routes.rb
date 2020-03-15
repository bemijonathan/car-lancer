Rails.application.routes.draw do
  get '/' => "application#index"
  get '/about' => "application#about"
  # resources "bidding"
  get 'login' => "application#login"
  get 'signup' => "application#signup"
  post 'search' => "application#search"
  get 'search' => "application#search"
  resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :owners
  post '/auth/login',to:"authentication#login" 
end

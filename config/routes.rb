Rails.application.routes.draw do
  resources :owners
  resources :shops
  resources :bank_details
  post '/auth/login',to:"authentication#login" 
end

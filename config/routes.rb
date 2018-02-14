Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :opi do
    post '/auth', to: 'auth#index'
    post '/location_id', to: 'auth#meeting_location'
    post '/meeting_id', to: "auth#meeting_room" 
  end



  get '/login', to: "login#index"
  post '/login', to: "login#create"
  get '/logout', to: "login#logout"
  get '/meeting', to: "meeting#index"
  post '/bookings', to: "meeting#create"
  get '/profile', to:"profile#index"
  patch '/profile', to:"profile#updateProfile"
  get '/password', to: "profile#password"
  patch '/password', to: "profile#updatePassword"
  get '/bookings', to: "bookings#index"
end

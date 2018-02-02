Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :opi do
    post '/auth', to: 'auth#index'
  end



  get '/login', to: "login#index"
  post '/login', to: "login#create"
  get '/logout', to: "login#logout"
  get '/meeting', to: "meeting#index"
  post '/bookings', to: "meeting#create"
end

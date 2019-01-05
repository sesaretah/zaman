Rails.application.routes.draw do
  resources :projects
  resources :profiles
    devise_for :users, :controllers => {:registrations => "registrations", sessions: "sessions"}
  resources :uploads
  resources :advertisers
  root 'home#index'
  get '/calendar/day/:unix_time', to: "calendar#day"
  post '/events', to: "events#create"
  get '/events/:id/delete', to: "events#destroy"
  get '/uploads/remoted/:id', to: "uploads#remoted"
end

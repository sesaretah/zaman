Rails.application.routes.draw do

  root 'home#index'
  get '/calendar/day/:unix_time', to: "calendar#day"
  post '/events', to: "events#create"
  get '/events/:id/delete', to: "events#destroy"
end

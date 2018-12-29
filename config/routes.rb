Rails.application.routes.draw do
  root 'home#index'
  get '/calendar/day/:unix_time', to: "calendar#day"
end

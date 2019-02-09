Rails.application.routes.draw do
  resources :projects
  resources :statuses
  resources :milestones
  resources :tasks
  resources :profiles
    devise_for :users, :controllers => {:registrations => "registrations", sessions: "sessions"}
  resources :uploads
  resources :advertisers
  root 'home#index'
  get '/calendar/day/:unix_time', to: "calendar#day"
  post '/events', to: "events#create"

  get '/events/:id/delete', to: "events#destroy"
  get '/uploads/remoted/:id', to: "uploads#remoted"
  get '/settings', to: 'settings#index'
  get '/settings/sections', to: 'settings#sections'

  post '/statuses', to: 'statuses#create'
  get '/statuses/:id/destroy', to: 'statuses#destroy'
  get '/statuses/:id/edit', to: 'statuses#edit'

  get '/advertisers/subscribe/:id', to: 'advertisers#subscribe'
  get '/advertisers/unsubscribe/:id', to: 'advertisers#unsubscribe'
  get '/advertisers/subscribers/:id', to: 'advertisers#subscribers'
  get '/advertisers/details/:id', to: 'advertisers#details'
  get '/advertisers/events/:id', to: 'advertisers#events'

  get '/projects/milestones/:id', to: 'projects#milestones'
  get '/milestones/list/:project_id', to: 'milestones#list'
  get '/milestones/:id/destroy', to: 'milestones#destroy'

  get '/projects/tasks/:id', to: 'projects#tasks'
  get '/tasks/list/:milestone_id', to: 'tasks#list'
  get '/tasks/:id/destroy', to: 'tasks#destroy'
end

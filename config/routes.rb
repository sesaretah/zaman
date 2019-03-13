Rails.application.routes.draw do
  resources :projects
  resources :statuses
  resources :milestones
  resources :tasks
  resources :profiles
    devise_for :users, :controllers => {:registrations => "registrations", sessions: "sessions"}
  resources :uploads
  resources :advertisers
  resources :discussion
  root 'home#index'
  get '/calendar/day/:unix_time', to: "calendar#day"
  get '/calendar/week/:unix_time', to: "calendar#week"

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
  get '/milestones/list/:id', to: 'milestones#list'
  get '/milestones/:id/destroy', to: 'milestones#destroy'


  get '/tasks/list/:id', to: 'tasks#list'
  get '/tasks/:id/destroy', to: 'tasks#destroy'

  get "/subscriptions/change_status/:id", to: 'subscriptions#change_status'
  get "/participations/change_status/:id", to: 'participations#change_status'

  get '/projects/participate/:id', to: 'projects#participate'
  get '/projects/unparticipate/:id', to: 'projects#unparticipate'
  get '/projects/participants/:id', to: 'projects#participants'
  get '/projects/details/:id', to: 'projects#details'
  get '/projects/events/:id', to: 'projects#events'
  get '/projects/tasks/:id', to: 'projects#tasks'
  get '/projects/gantt/:id', to: 'projects#gantt'
end

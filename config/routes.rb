Rails.application.routes.draw do
  # Routes for the Invite resource:
  # CREATE
  get "/invites/new", :controller => "invites", :action => "new"
  post "/create_invite", :controller => "invites", :action => "create"

  # READ
  get "/invites", :controller => "invites", :action => "index"
  get "/invites/:id", :controller => "invites", :action => "show"

  # UPDATE
  get "/invites/:id/edit", :controller => "invites", :action => "edit"
  post "/update_invite/:id", :controller => "invites", :action => "update"

  # DELETE
  get "/delete_invite/:id", :controller => "invites", :action => "destroy"
  #------------------------------

  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/events/:id", :controller => "events", :action => "show"

  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"

  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

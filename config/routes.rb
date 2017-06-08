Rails.application.routes.draw do
  # Routes for the Message resource:
  # CREATE
  get "/messages/new", :controller => "messages", :action => "new"
  post "/create_message", :controller => "messages", :action => "create"

  # READ
  get "/messages", :controller => "messages", :action => "index"
  get "/messages/:id", :controller => "messages", :action => "show"

  # UPDATE
  get "/messages/:id/edit", :controller => "messages", :action => "edit"
  post "/update_message/:id", :controller => "messages", :action => "update"

  # DELETE
  get "/delete_message/:id", :controller => "messages", :action => "destroy"
  #------------------------------

  # Routes for the School resource:
  # CREATE
  get "/schools/new", :controller => "schools", :action => "new"
  post "/create_school", :controller => "schools", :action => "create"

  # READ
  get "/schools", :controller => "schools", :action => "index"
  get "/schools/:id", :controller => "schools", :action => "show"

  # UPDATE
  get "/schools/:id/edit", :controller => "schools", :action => "edit"
  post "/update_school/:id", :controller => "schools", :action => "update"

  # DELETE
  get "/delete_school/:id", :controller => "schools", :action => "destroy"
  #------------------------------

  # Routes for the Friend resource:
  # CREATE
  get "/friends/new", :controller => "friends", :action => "new"
  post "/create_friend", :controller => "friends", :action => "create"

  # READ
  get "/friends", :controller => "friends", :action => "index"
  get "/friends/:id", :controller => "friends", :action => "show"

  # UPDATE
  get "/friends/:id/edit", :controller => "friends", :action => "edit"
  post "/update_friend/:id", :controller => "friends", :action => "update"

  # DELETE
  get "/delete_friend/:id", :controller => "friends", :action => "destroy"
  #------------------------------

  # Routes for the Favorite resource:
  # CREATE
  get "/favorites/new", :controller => "favorites", :action => "new"
  post "/create_favorite", :controller => "favorites", :action => "create"

  # READ
  get "/favorites", :controller => "favorites", :action => "index"
  get "/favorites/:id", :controller => "favorites", :action => "show"

  # UPDATE
  get "/favorites/:id/edit", :controller => "favorites", :action => "edit"
  post "/update_favorite/:id", :controller => "favorites", :action => "update"

  # DELETE
  get "/delete_favorite/:id", :controller => "favorites", :action => "destroy"
  #------------------------------

  # Routes for the Case resource:
  # CREATE
  get "/cases/new", :controller => "cases", :action => "new"
  post "/create_case", :controller => "cases", :action => "create"

  # READ
  get "/cases", :controller => "cases", :action => "index"
  get "/cases/:id", :controller => "cases", :action => "show"

  get "/top_cases", :controller => "cases", :action => "top_cases"
  get "/my_favorites", :controller => "cases", :action => "my_favorites"

  # UPDATE
  get "/cases/:id/edit", :controller => "cases", :action => "edit"
  post "/update_case/:id", :controller => "cases", :action => "update"

  # DELETE
  get "/delete_case/:id", :controller => "cases", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # READ for users
    get "/users", :controller => "users", :action => "index"
    get "/users/:id", :controller => "users", :action => "show"

get "/my_friends", :controller => "users", :action => "my_friends"

root 'cases#index'

end

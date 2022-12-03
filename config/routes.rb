Rails.application.routes.draw do
  #get "todos" , to: "todos#index"
  #get "todos/:id", to: "todos#show"
  #post "users/login" , to: "login#create"
  get "/" , to: "home#index"

  resources:todos
  resources:users

  get "/signin" , to: "sessions#new" , as: :new_sessions
  post "/signin" , to: "sessions#create" , as: :sessions
end

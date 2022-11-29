Rails.application.routes.draw do
  #get "todos" , to: "todos#index"
  #get "todos/:id", to: "todos#show"
  get "users/login" , to: "users#login"
  #post "users/login" , to: "login#create"
  resources:todos
  resources:users
end

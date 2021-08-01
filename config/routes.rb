Rails.application.routes.draw do

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"


  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index"
  get "users/:id" => "users#show"


  get 'users/index'
  get 'posts/index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  post 'posts/create'
  get 'posts/:id/edit' => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get 'search' => 'posts#search'

  post "reservations/:post_id/create" => "reservations#create"

  get 'reservations/index'

  get 'users/:id/reservations' =>'users#reservations'



  get '/' => 'home#top'

end

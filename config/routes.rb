Rails.application.routes.draw do



  get 'pages/index'

  root 'pages#index'

  get '/login',     :to => 'sessions#login'
  post '/sessions', :to => 'sessions#create'
  get '/logout',    :to => 'sessions#logout'
  get "/signup", to: "users#new"

  put '/users/edit', to: 'users#update', as: :user
  post '/users/edit', to: 'users#update'

  resources :users
  resources :businesses
end

#        Prefix Verb   URI Pattern                    Controller#Action
#   pages_index GET    /pages/index(.:format)         pages#index
#          root GET    /                              pages#index
#         login GET    /login(.:format)               sessions#new
#      sessions POST   /sessions(.:format)            sessions#create
#        logout GET    /logout(.:format)              sessions#destroy
#        signup GET    /signup(.:format)              users#new
#         users GET    /users(.:format)               users#index
#               POST   /users(.:format)               users#create
#     edit_user GET    /users/:id/edit(.:format)      users#edit
#          user GET    /users/:id(.:format)           users#show
#               PATCH  /users/:id(.:format)           users#update
#               PUT    /users/:id(.:format)           users#update
#               DELETE /users/:id(.:format)           users#destroy
#    businesses GET    /businesses(.:format)          businesses#index
#               POST   /businesses(.:format)          businesses#create
#  new_business GET    /businesses/new(.:format)      businesses#new
# edit_business GET    /businesses/:id/edit(.:format) businesses#edit
#      business GET    /businesses/:id(.:format)      businesses#show
#               PATCH  /businesses/:id(.:format)      businesses#update
#               PUT    /businesses/:id(.:format)      businesses#update
#               DELETE /businesses/:id(.:format)      businesses#destroy


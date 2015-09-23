Rails.application.routes.draw do

  # users
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, except: [:new, :create]

  # sessions
  get '/login',     :to => 'sessions#new'
  post '/sessions', :to => 'sessions#create'
  get '/logout',    :to => 'sessions#destroy'

  # payment
  get 'payment/index'
  post 'payment/index'
  post 'payment/pay'

  # businesses
  get '/businesses', to: 'businesses#index'
  resources :businesses, except: [:index]
  resources :biz

  # map
  root 'maps#index'

  #pages
  get '/about', to: 'pages#show'

  # groupon api
  get '/results', to: 'biz#index'
  resources :biz

end
#        signup GET    /signup(.:format)              users#new
#               POST   /signup(.:format)              users#create
#         users GET    /users(.:format)               users#index
#     edit_user GET    /users/:id/edit(.:format)      users#edit
#          user GET    /users/:id(.:format)           users#show
#               PATCH  /users/:id(.:format)           users#update
#               PUT    /users/:id(.:format)           users#update
#               DELETE /users/:id(.:format)           users#destroy
#         login GET    /login(.:format)               sessions#new
#      sessions POST   /sessions(.:format)            sessions#create
#        logout GET    /logout(.:format)              sessions#destroy
# payment_index GET    /payment/index(.:format)       payment#index
#               POST   /payment/index(.:format)       payment#index
#   payment_pay POST   /payment/pay(.:format)         payment#pay
#    businesses GET    /businesses(.:format)          businesses#index
#               POST   /businesses(.:format)          businesses#create
#  new_business GET    /businesses/new(.:format)      businesses#new
# edit_business GET    /businesses/:id/edit(.:format) businesses#edit
#      business GET    /businesses/:id(.:format)      businesses#show
#               PATCH  /businesses/:id(.:format)      businesses#update
#               PUT    /businesses/:id(.:format)      businesses#update
#               DELETE /businesses/:id(.:format)      businesses#destroy
#          root GET    /                              maps#index
#         about GET    /about(.:format)               pages#show
#     biz_index GET    /biz(.:format)                 biz#index
#               POST   /biz(.:format)                 biz#create
#       new_biz GET    /biz/new(.:format)             biz#new
#      edit_biz GET    /biz/:id/edit(.:format)        biz#edit
#           biz GET    /biz/:id(.:format)             biz#show
#               PATCH  /biz/:id(.:format)             biz#update
#               PUT    /biz/:id(.:format)             biz#update
#               DELETE /biz/:id(.:format)             biz#destroy

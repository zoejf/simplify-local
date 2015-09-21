Rails.application.routes.draw do

  # users
  get "/signup", to: "users#new"
  resources :users, except: [:new]

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

  # map
  root 'maps#index'

end

# signup GET    /signup(.:format)                     users#new
#         users GET    /users(.:format)               users#index
#               POST   /users(.:format)               users#create
#     edit_user GET    /users/:id/edit(.:format)      users#edit
#          user GET    /users/:id(.:format)           users#show
#               PATCH  /users/:id(.:format)           users#update
#               PUT    /users/:id(.:format)           users#update
#               DELETE /users/:id(.:format)           users#destroy
#         login GET    /login(.:format)               sessions#login
#      sessions POST   /sessions(.:format)            sessions#create
#        logout GET    /logout(.:format)              sessions#logout
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

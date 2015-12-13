Rails.application.routes.draw do

  get 'beauty_and_spa/index'
  get 'shopping/index'
  get 'health_and_fitness/index'
  get 'things_to_do/index'
  get 'local_services/index'
  get 'food_and_drink/index'


  # users
  get "/signup", to: "users#new"
  post "/users", to: "users#create"
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
  resources :good_biz

end
#                   Prefix Verb   URI Pattern                            Controller#Action
#     beauty_and_spa_index GET    /beauty_and_spa/index(.:format)        beauty_and_spa#index
#      beauty_and_spa_show GET    /beauty_and_spa/show(.:format)         beauty_and_spa#show
#           shopping_index GET    /shopping/index(.:format)              shopping#index
#            shopping_show GET    /shopping/show(.:format)               shopping#show
# health_and_fitness_index GET    /health_and_fitness/index(.:format)    health_and_fitness#index
#  health_and_fitness_show GET    /health_and_fitness/show(.:format)     health_and_fitness#show
#       things_to_do_index GET    /things_to_do/index(.:format)          things_to_do#index
#        things_to_do_show GET    /things_to_do/show(.:format)           things_to_do#show
#     local_services_index GET    /local_services/index(.:format)        local_services#index
#      local_services_show GET    /local_services/show(.:format)         local_services#show
#     food_and_drink_index GET    /food_and_drink/index(.:format)        food_and_drink#index
#      food_and_drink_show GET    /food_and_drink/show(.:format)         food_and_drink#show
#                   signup GET    /signup(.:format)                      users#new
#                          POST   /signup(.:format)                      users#create
#                    users GET    /users(.:format)                       users#index
#                edit_user GET    /users/:id/edit(.:format)              users#edit
#                     user GET    /users/:id(.:format)                   users#show
#                          PATCH  /users/:id(.:format)                   users#update
#                          PUT    /users/:id(.:format)                   users#update
#                          DELETE /users/:id(.:format)                   users#destroy
#                    login GET    /login(.:format)                       sessions#new
#                 sessions POST   /sessions(.:format)                    sessions#create
#                   logout GET    /logout(.:format)                      sessions#destroy
#            payment_index GET    /payment/index(.:format)               payment#index
#                          POST   /payment/index(.:format)               payment#index
#              payment_pay POST   /payment/pay(.:format)                 payment#pay
#               businesses GET    /businesses(.:format)                  businesses#index
#                          POST   /businesses(.:format)                  businesses#create
#             new_business GET    /businesses/new(.:format)              businesses#new
#            edit_business GET    /businesses/:id/edit(.:format)         businesses#edit
#                 business GET    /businesses/:id(.:format)              businesses#show
#                          PATCH  /businesses/:id(.:format)              businesses#update
#                          PUT    /businesses/:id(.:format)              businesses#update
#                          DELETE /businesses/:id(.:format)              businesses#destroy
#                biz_index GET    /biz(.:format)                         biz#index
#                          POST   /biz(.:format)                         biz#create
#                  new_biz GET    /biz/new(.:format)                     biz#new
#                 edit_biz GET    /biz/:id/edit(.:format)                biz#edit
#                      biz GET    /biz/:id(.:format)                     biz#show
#                          PATCH  /biz/:id(.:format)                     biz#update
#                          PUT    /biz/:id(.:format)                     biz#update
#                          DELETE /biz/:id(.:format)                     biz#destroy
#                     root GET    /                                      maps#index
#                    about GET    /about(.:format)                       pages#show
#                  results GET    /results(.:format)                     biz#index
#                          GET    /biz(.:format)                         biz#index
#                          POST   /biz(.:format)                         biz#create
#                          GET    /biz/new(.:format)                     biz#new
#                          GET    /biz/:id/edit(.:format)                biz#edit
#                          GET    /biz/:id(.:format)                     biz#show
#                          PATCH  /biz/:id(.:format)                     biz#update
#                          PUT    /biz/:id(.:format)                     biz#update
#                          DELETE /biz/:id(.:format)                     biz#destroy
#           good_biz_index GET    /good_biz(.:format)                    good_biz#index
#                          POST   /good_biz(.:format)                    good_biz#create
#             new_good_biz GET    /good_biz/new(.:format)                good_biz#new
#            edit_good_biz GET    /good_biz/:id/edit(.:format)           good_biz#edit
#                 good_biz GET    /good_biz/:id(.:format)                good_biz#show
#                          PATCH  /good_biz/:id(.:format)                good_biz#update
#                          PUT    /good_biz/:id(.:format)                good_biz#update
#                          DELETE /good_biz/:id(.:format)                good_biz#destroy
#                          GET    /beauty_and_spa(.:format)              beauty_and_spa#index
#                          POST   /beauty_and_spa(.:format)              beauty_and_spa#create
#       new_beauty_and_spa GET    /beauty_and_spa/new(.:format)          beauty_and_spa#new
#      edit_beauty_and_spa GET    /beauty_and_spa/:id/edit(.:format)     beauty_and_spa#edit
#           beauty_and_spa GET    /beauty_and_spa/:id(.:format)          beauty_and_spa#show
#                          PATCH  /beauty_and_spa/:id(.:format)          beauty_and_spa#update
#                          PUT    /beauty_and_spa/:id(.:format)          beauty_and_spa#update
#                          DELETE /beauty_and_spa/:id(.:format)          beauty_and_spa#destroy
#                          GET    /food_and_drink(.:format)              food_and_drink#index
#                          POST   /food_and_drink(.:format)              food_and_drink#create
#       new_food_and_drink GET    /food_and_drink/new(.:format)          food_and_drink#new
#      edit_food_and_drink GET    /food_and_drink/:id/edit(.:format)     food_and_drink#edit
#           food_and_drink GET    /food_and_drink/:id(.:format)          food_and_drink#show
#                          PATCH  /food_and_drink/:id(.:format)          food_and_drink#update
#                          PUT    /food_and_drink/:id(.:format)          food_and_drink#update
#                          DELETE /food_and_drink/:id(.:format)          food_and_drink#destroy
#                          GET    /health_and_fitness(.:format)          health_and_fitness#index
#                          POST   /health_and_fitness(.:format)          health_and_fitness#create
#   new_health_and_fitness GET    /health_and_fitness/new(.:format)      health_and_fitness#new
#  edit_health_and_fitness GET    /health_and_fitness/:id/edit(.:format) health_and_fitness#edit
#       health_and_fitness GET    /health_and_fitness/:id(.:format)      health_and_fitness#show
#                          PATCH  /health_and_fitness/:id(.:format)      health_and_fitness#update
#                          PUT    /health_and_fitness/:id(.:format)      health_and_fitness#update
#                          DELETE /health_and_fitness/:id(.:format)      health_and_fitness#destroy
#           local_services GET    /local_services(.:format)              local_services#index
#                          POST   /local_services(.:format)              local_services#create
#        new_local_service GET    /local_services/new(.:format)          local_services#new
#       edit_local_service GET    /local_services/:id/edit(.:format)     local_services#edit
#            local_service GET    /local_services/:id(.:format)          local_services#show
#                          PATCH  /local_services/:id(.:format)          local_services#update
#                          PUT    /local_services/:id(.:format)          local_services#update
#                          DELETE /local_services/:id(.:format)          local_services#destroy
#                          GET    /shopping(.:format)                    shopping#index
#                          POST   /shopping(.:format)                    shopping#create
#             new_shopping GET    /shopping/new(.:format)                shopping#new
#            edit_shopping GET    /shopping/:id/edit(.:format)           shopping#edit
#                 shopping GET    /shopping/:id(.:format)                shopping#show
#                          PATCH  /shopping/:id(.:format)                shopping#update
#                          PUT    /shopping/:id(.:format)                shopping#update
#                          DELETE /shopping/:id(.:format)                shopping#destroy
#                          GET    /things_to_do(.:format)                things_to_do#index
#                          POST   /things_to_do(.:format)                things_to_do#create
#         new_things_to_do GET    /things_to_do/new(.:format)            things_to_do#new
#        edit_things_to_do GET    /things_to_do/:id/edit(.:format)       things_to_do#edit
#             things_to_do GET    /things_to_do/:id(.:format)            things_to_do#show
#                          PATCH  /things_to_do/:id(.:format)            things_to_do#update
#                          PUT    /things_to_do/:id(.:format)            things_to_do#update
#                          DELETE /things_to_do/:id(.:format)            things_to_do#destroy
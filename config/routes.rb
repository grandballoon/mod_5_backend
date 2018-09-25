Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
   namespace :v1 do
     resources :users, only: [:create, :index]
     post '/login', to: 'auth#create'
     get '/profile', to: 'users#profile'
     post '/logout', to: 'auth#logout'
     post '/subscribe', to: 'users#subscribe'
     post '/unsubscribe', to: 'users#unsubscribe'
     resources :facts
   end
 end
end

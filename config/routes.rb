Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #Find Endpoints
      get '/merchants/find', to: 'merchants/search#show'
      
      #API Endpoints
      resources :items, only: [:index, :show]
      resources :merchants, only: [:index, :show]

      #Relationships
      get '/items/:id/merchant', to: 'itemsmerchant#show'
      get '/merchants/:id/items', to: 'itemsmerchant#index'
    end
  end
end

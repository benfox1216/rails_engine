Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #Find Endpoints
      get '/merchants/find', to: 'merchants/search#show'
      
      #Business Intelligence
      get '/merchants/most_revenue', to: 'merchants/business#index_most_revenue'
      get '/merchants/most_items', to: 'merchants/business#index_most_items'
      
      #API Endpoints
      resources :items, only: [:index, :show]
      resources :merchants, only: [:index, :show]

      #Relationships
      get '/items/:id/merchant', to: 'itemsmerchant#show'
      get '/merchants/:id/items', to: 'itemsmerchant#index'
    end
  end
end

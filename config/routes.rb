Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #Find Endpoints
      get '/merchants/find', to: 'merchants/search#show'
      get '/items/find', to: 'items/search#show'
      
      #Business Intelligence
      get '/merchants/most_revenue', to: 'merchants/most_revenue#index'
      get '/merchants/most_items', to: 'merchants/most_items#index'
      get '/revenue', to: 'revenue#index'
      
      #API Endpoints
      resources :items, only: [:index, :show, :create, :destroy, :update]
      resources :merchants, only: [:index, :show, :create, :destroy, :update]

      #Relationships
      get '/items/:id/merchant', to: 'itemsmerchant#show'
      get '/merchants/:id/items', to: 'itemsmerchant#index'
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      
      #Relationships
      get '/items/:id/merchant', to: 'itemsmerchant#show'
      get '/merchants/:id/items', to: 'itemsmerchant#index'
      
      get '/merchants/find', to: 'merchant_search#show'
      get '/merchants/find_all', to: 'merchant_search#show'
      get '/items/find', to: 'item_search#show'
      get '/items/find_all', to: 'item_search#index'
      end
    end
  end
end

Rails.application.routes.draw do
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'main/login'
  get 'main/create'
  get 'main/user_Item'
  get 'shop/:id', to: 'shop#shop'
  get '/inventories/buy/:id/:prev', to: 'inventories#buy'
  get 'main/inventories'
  get 'main/destroy_item/:id', to: 'main#destroy_item'
end

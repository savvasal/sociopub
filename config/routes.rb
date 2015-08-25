Rails.application.routes.draw do

  # u: Users
  # a: Admin
  # v: Visitor
  # e: Everyone
  
  # e
  root 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # v
  get 'signup' => 'users#new'

  # ua
  get 'ideas' => 'static_pages#ideas'


  # u
  get 'subscribe' => 'subscriptions#index'
  post 'subscribe' => 'subscriptions#create'
  delete 'usubscribe' => 'subscriptions#destroy'
  get 'newspaper' => 'newspaper#index'
  get 'feeds' => 'feeds#index'
  get 'add' => 'feeds#new'
  post 'add' => 'feeds#create'
  
  delete 'logout' => 'sessions#destroy'

  # a
  get 'entries' => 'entries#index'
  get 'websites' => 'websites#index'
  put 'websites' => 'websites#update'
  resources :websites, only: [:index, :update]

  # au
  resources :subscriptions
  resources :users
  resources :feeds
  resources :entries
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  # a
  resources :fetch_items_from_feed, only: [:edit]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

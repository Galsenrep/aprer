Rails.application.routes.draw do


  devise_scope :admin do
    get "admins/sign_up" => "devise/sessions#new" # custom path to sign_up/registration
    get "admin" => "devise/sessions#new"
    #get "users" => "devise/sessions#new"
  end

  devise_scope :user do
    get "users/sign_up" => "devise/registrations#new" # custom path to sign_up/registration
    get "users/confirmation" => "confirmations#create"
    get "users/sign_in" => "devise/sessions#new"
    get "users/admin" => "devise/sessions#new"
  end

  devise_for :admins, controllers: {confirmations: 'confirmations'}


  mount Ckeditor::Engine => '/ckeditor'
  get 'contact' => 'contacts#index'
  get 'articles/new' => 'articles#new'
  get 'articles/:slug' => 'articles#show', :as => :article_slug


  resources "contacts", only: [:new, :create]


  get 'galerie' => 'galeries#index'

  get 'actualites' => 'actualites#index'

  get 'parrainage' => 'parrainage#index'

  get 'activities' => 'activities#index'

  get 'apropos' => 'apropos#index'


  get 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  #get 'users/edit/:id' => 'devise/registrations#edit', :as => :admin_edit_user

  #get 'articles/:id' => 'articles#destroy', :via => :delete, :as => :destroy_article

  #get 'lesimages/:id' => 'lesimages#destroy', :via => :delete, :as => :destroy_lesimages

  #get 'lesimages/index'

  #devise_for :users

  #get 'lesimages/index'


  devise_for :users, controllers: {confirmations: 'confirmations'}
  #get 'aprer_pages/index'
  root 'aprer_pages#index'

  resources 'users'
  resources 'articles'
  resources 'lesimages'

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

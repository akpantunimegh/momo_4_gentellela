Rails.application.routes.draw do


  resources :banks
  devise_for :users #, skip: [:sessions]
 #  :users do
    #get 'login' => 'devise/sessions#new'
    #get 'sign_up' => 'devise/registrations#new'
    #delete 'logout', to: 'devise/sessions#destroy'
    #get 'signup', to: 'devise/sessions#new' #, as: :new_user_registration
    #get 'signin', to: 'devise/sessions#new', as: :new_user_session
    #post 'signin', to: 'devise/sessions#create' , as: :user_session
    #match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  #end
 # devise_for :users, controllers: {
 #     Sessions: 'users/sessions'
 # }
#end

  #authenticated :user do
   # root  'users#dash', as: :authenticated_root
  #end

 # You can have the root of your site routed with "root"
  root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".



resources :welcome do
  member do
    get '/about_us' => 'welcome#about_us'
  end

  end
  #resources :subscriptions
  get '/subscriptions/list/' => 'subscriptions#list', as: :list_subscription
  get '/subscriptions' => 'subscriptions#index'
  get '/subscriptions/new' => 'subscriptions#new', as: :new_subscription
  get '/subscription/:id/edit' => 'subscriptions#edit', as: :edit_subscription
  get '/subscription/:id' => 'subscriptions#show', as: :subscription
  post '/subscriptions' => 'subscriptions#create'


  get '/users/:id/dash' => 'users#dash', as: :dash_user
  get '/users/:id/profile' => 'users#profile', as: :profile_user
  get 'serve' => 'users#serve', as: :serve_photo
  resources :users do

    #member do
      #get 'users/:id' => 'users#show'
      #get 'users/:id/dash/' => 'users#dash'
      #get 'dash/:id' => 'users#dash', as: :dash

    #end
        resources :accounts do
            member do
              get 'dash' => 'accounts#dash'
              get 'display' => 'accounts/search'
              get 'search'
            end
            resources :wallets
            resources :vaults
            resources :instants do
              resources :payments
            end
          end
      end

  resources :errors do
    member do
      get 'user'
      get 'show'
      get 'delete'
      get 'notfound'# => 'errors#notfound'

    end
  end


  get 'external_pages/about_us'
  get 'external_pages/team'
  get 'external_pages/faqs'


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

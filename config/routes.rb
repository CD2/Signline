Rails.application.routes.draw do

  resources :enquiries, only: [:new, :create] do 
    collection { get :thanks }
  end
  resources :brands
  resources :orders do 
    get :shipping_method, path: "shipping"
    get :summary
    post :go_back
    get :express_checkout
    get :purchase
  end

  #user account paths
  scope module: :user_system do
    resources :users, path: "user", except: [:index, :destroy]
    resources :sessions, only: [:new, :create, :destroy] do
      collection { get :get_user_id }
    end
    resources :account_activations, only: :edit
    resources :password_resets, except: [:index, :show, :destroy]
  end

  #admin paths
  namespace :admin do 
    resources :sites, except: :show do 
      get :toggle_status
      resources :pages, except: :show
      resources :categories, only: :index
      resources :products, only: :index
      resources :menu_items, except: :show
    end
    resources :users, except: :show
    resources :categories, except: :show
    resources :products, except: :show do 
      collection { get :export }
    end 
    resources :orders, only: [:index, :show]
  end

  
  resources :products, only: [:index, :show]
  resources :product_imports, only: [:new, :create] do 
    get :confirm_import
    post :process_import
  end
  resources :categories, only: [:index, :show]
  resources :carts, only: [:index, :destroy], path: "cart"
  resources :cart_items, only: :update do
    collection do
      put 'add'
    end
  end

  get    'signup'  => 'user_system/users#new'
  get    'login'   => 'user_system/sessions#new'
  post   'login'   => 'user_system/sessions#create'
  delete 'logout'  => 'user_system/sessions#destroy'

  post    'activate_admin' => 'user_system/sessions#admin_visible_toggle'
  post    'admin/remove_image' => 'admin/products#remove_image'

  get 'feeds'=> 'static_pages#feeds' 

  post 'uploads' => 'images#upload'

  root 'pages#show'
  resources :pages, path: "", only: :show

end

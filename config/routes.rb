Rails.application.routes.draw do

  
  resources :enquiries, only: [:index, :create] do 
    collection { get :thanks }
  end
  resources :brands
  resources :orders do 
    get :shipping_method, path: "shipping"
    get :summary
    post :go_back
  end
  #user account paths
  scope module: :user_system do
    resources :users, path: "user", only: [:new, :create, :edit, :update, :show]
    resources :sessions, only: [:new, :create, :destroy] do 
      collection { get :get_user_id }
    end
    resources :account_activations, only: :edit
    resources :password_resets, only: [:new, :create, :edit, :update]
  end

  #admin paths
  namespace :admin do 
    resources :sites, only: [:new, :create, :index, :update, :edit, :destroy] do 
      get :toggle_status
      resources :pages, only: [:new, :create, :index, :update, :edit, :destroy]
      resources :categories, only: [:index]
      resources :products, only: [:index]
      resources :menu_items, only: [:new, :create, :update, :edit, :destroy, :index]
    end
    resources :users, only: [:new, :create, :index, :update, :edit, :destroy]
    resources :categories, only: [:new, :create, :index, :update, :edit, :destroy]
    resources :products, only: [:new, :create, :index, :update, :edit, :destroy] do 
      collection { get :export }
    end 
    resources :orders, only: :index
  end

  
  resources :products, only: :show
  resources :product_imports, only: [:new, :create] do 
    get :confirm_import
    post :process_import
  end
  resources :categories, only: [:index, :show]
  resources :carts, only: [:index, :destroy], path: "cart"
  resources :cart_items, only: :update

  root                'static_pages#home'
  get    'signup'  => 'user_system/users#new'
  get    'login'   => 'user_system/sessions#new'
  post   'login'   => 'user_system/sessions#create'
  post   'add_to_cart'  => 'cart_items#create'
  delete 'logout'  => 'user_system/sessions#destroy'

  post    'activate_admin' => 'user_system/sessions#admin_visible_toggle'
  post    'admin/remove_image' => 'admin/products#remove_image'

  get 'feeds'=> 'static_pages#feeds' 

  match '/uploads', to: 'images#upload', via: 'post'

  resources :pages, path: "", only: :show

end

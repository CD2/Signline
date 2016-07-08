Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :enquiries, only: [:new, :create] do 
    collection { get :thanks }
  end
  resources :brands

  #index: all your previous orders
  resources :orders, only: [:index, :show] do 
    # get :shipping_method, path: "shipping"
    # get :summary
    # post :go_back
    # get :express_checkout
    # get :purchase
  end
  
  resource :carts, path: 'cart', only: [:show] do
    resources :items, controller: :cart_items, only: [:create, :update, :destroy]
    collection do
      get :previous
      get :checkout
      post :update_checkout
      get :express_checkout
      post :paypal_finish
    end
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
    resources :settings
    resources :sites
    resources :pages, except: :show
    resources :categories, only: :index
    resources :products, only: :index do
      member do
        get :ebay
      end
    end
    resources :users, except: :show
    resources :categories, except: :show
    resources :products, except: :show do
      collection do
        get :pull_from_amazon
        post :check_generated_report_id
        get :process_generated_report
      end
    end
    resources :orders do
      collection { get :manage }
      member do
        get :print
        get :complete_order
        get :flag
        get :resolve_flag
        get :duplicate
        get :resend_emails
      end
      resources :notes
    end

  end

  
  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]


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

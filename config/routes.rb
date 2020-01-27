Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "products#index"
  resources :products do
    member do
      get 'purchase'
      get 'purchase_done'
    end
  end
    
  resources :signup do
    collection do
      get 'registration_nickname'
      get 'registration_sms'
      get 'registration_address'
      get 'registration_card'
      get 'registration_done'
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :purchases, only: [:index] do
    collection do
      get 'index', to: 'purchases#index'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
  end
  # 下記の囲いは、作業用仮設定。あとで、必ず削除する（かも）
  # -----------------------------------------------------------------------------
  get 'mypages/index'  => 'mypages#index'
  get 'mypages/credit'  => 'mypages#credit'
  get 'mypages/identification'  => 'mypages#identification'
  get 'mypages/logout'  => 'mypages#logout'
  get 'mypages/new'    =>   'mypages#new'
  post 'mypages/post'   => 'myoages#create'
  get 'test_okubo/index'  => 'test_okubo#index'
  get 'test_okubo/link'  => 'test_okubo#link'
  # -----------------------------------------------------------------------------
end

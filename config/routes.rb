Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations",
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  root "products#index"
  resources :products do
    member do
      get 'purchase'
      get 'purchase_done'
      get 'buy', to: 'products#buy'
      # post 'pay', to: 'products#pay'
      get 'done', to: 'products#done' #変更点はここだよ(・ω・)
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
    end
    #変更点はここだよ(・ω・)
    member do
      post 'pay', to: 'purchases#pay'
    end
  end
  # 下記の囲いは、作業用仮設定。あとで、必ず削除する（かも）
  # -----------------------------------------------------------------------------
  get 'mypages/index'  => 'mypages#index'
  get 'mypages/exhibition' => 'mypages#exhibition'
  get 'mypages/credit'  => 'mypages#credit'
  get 'mypages/identification'  => 'mypages#identification'
  get 'mypages/logout'  => 'mypages#logout'
  get 'mypages/profile'  => 'mypages#profile'
  get 'test_okubo/index'  => 'test_okubo#index'
  get 'test_okubo/link'  => 'test_okubo#link'
  # -----------------------------------------------------------------------------
end
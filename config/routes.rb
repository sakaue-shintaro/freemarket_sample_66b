Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "products#index"
  resources :products do
    collection do
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


  
  # 下記の囲いは、作業用仮設定。あとで、必ず削除する（かも）
  # -----------------------------------------------------------------------------
  get 'mypages/index'  => 'mypages#index'
  get 'mypages/credit'  => 'mypages#credit'
  get 'mypages/identification'  => 'mypages#identification'
  get 'mypages/logout'  => 'mypages#logout'
  get 'test_okubo/index'  => 'test_okubo#index'
  get 'test_okubo/link'  => 'test_okubo#link'
  # -----------------------------------------------------------------------------
end

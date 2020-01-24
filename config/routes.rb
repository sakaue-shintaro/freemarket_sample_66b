Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products
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
  get 'signup/index'  => 'signup#index'
  # get 'card/index'  =>   'card#index'
  # get 'cards/new' => 'cards#new'
  # get 'card/create'  => 'card#create'
  # get 'signup/data1'  => 'signup#data1'
  # get 'signup/data2'  => 'signup#data2'
  # get 'signup/data3'  => 'signup#data3'
  # get 'signup/data4'  => 'signup#data4'
  # get 'signup/data5'  => 'signup#data5'
  # get 'products/show'  => 'products#show'
  # -----------------------------------------------------------------------------
end

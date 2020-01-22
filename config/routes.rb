Rails.application.routes.draw do
  devise_for :user
  root "products#index"
  resources :products, only:[:new]
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      get 'data1'
      get 'data2'
      get 'data3'
      get 'data4'
      get 'data5'
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
  # get 'signup/index'  => 'signup#index'
  # get 'signup/data1'  => 'signup#data1'
  # get 'signup/data2'  => 'signup#data2'
  # get 'signup/data3'  => 'signup#data3'
  # get 'signup/data4'  => 'signup#data4'
  # get 'signup/data5'  => 'signup#data5'
  get 'products/show'  => 'products#show'
  # -----------------------------------------------------------------------------
end

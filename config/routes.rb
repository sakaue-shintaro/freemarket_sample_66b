Rails.application.routes.draw do
  devise_for :user
  root "products#index"
  resources :products, only:[:new]
  resources :signup, only:[:index]
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
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
  get 'signup/ragistration_data1'  => 'signup#ragistration_data1'
  get 'signup/ragistration_data2'  => 'signup#ragistration_data2'
  get 'signup/ragistration_data3'  => 'signup#ragistration_data3'
  get 'signup/ragistration_data4'  => 'signup#ragistration_data4'
  get 'signup/ragistration_data5'  => 'signup#ragistration_data5'
  get 'products/show'  => 'products#show'
  # -----------------------------------------------------------------------------


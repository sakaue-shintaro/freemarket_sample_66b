Rails.application.routes.draw do
  devise_for :user
  root "products#index"
  resources :products, only:[:new]
  
  # 下記の囲いは、作業用仮設定。あとで、必ず削除する（かも）
  # -----------------------------------------------------------------------------
  get 'signup/index'  => 'signup#index'
  get 'mypages/index'  => 'mypages#index'
  get 'mypages/credit'  => 'mypages#credit'
  get 'mypages/identification'  => 'mypages#identification'
  get 'mypages/logout'  => 'mypages#logout'
  get 'test_okubo/index'  => 'test_okubo#index'
  get 'test_okubo/link'  => 'test_okubo#link'
  get 'signup/step1'  => 'signup#step1'
  get 'signup/step2'  => 'signup#step2'
  get 'signup/step3'  => 'signup#step3'
  get 'signup/step4'  => 'signup#step4'
  get 'signup/step5'  => 'signup#step5'
  get 'products/show'  => 'products#show'
  # -----------------------------------------------------------------------------
end

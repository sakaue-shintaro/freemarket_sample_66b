Rails.application.routes.draw do
  # devise_for :users
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  # 下記の囲いは、作業用仮設定。あとで、必ず削除する（かも）
  # -----------------------------------------------------------------------------
  get 'signup/index'  => 'signup#index'
  get 'mypages/index'  => 'mypages#index'
  get 'test_okubo/index'  => 'test_okubo#index'
  get 'test_okubo/link'  => 'test_okubo#link'
  get 'signup/registration_data1'  => 'signup#ragistration_data1'
  get 'signup/registration_data2'  => 'signup#ragistration_data2'
  get 'signup/registration_data3'  => 'signup#ragistration_data3'
  get 'signup/registration_data4'  => 'signup#ragistration_data4'
  get 'signup/registration_data5'  => 'signup#ragistration_data5'
  # -----------------------------------------------------------------------------
end

Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  get 'signup/index'  => 'signup#index'
  get 'mypages/index'  => 'mypages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

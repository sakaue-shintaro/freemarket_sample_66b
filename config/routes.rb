Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: "signup",
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  devise_scope :user do
    get 'registration_index', to: 'signup#index'
    get 'registration_nickname', to: 'signup#registration_nickname'
    get 'registration_sms', to: 'signup#registration_sms'
    get 'registration_address', to: 'signup#registration_address'
    get 'registration_card', to: 'signup#registration_card'
    get 'registration_done', to: 'signup#registration_done'
  end


  root "products#index"
  resources :products do
    member do
      get 'purchase'
      get 'purchase_done'
      get 'buy', to: 'products#buy'
      get 'done', to: 'products#done'
    end
  end
    
  # resources :signup do
  #   collection do
  #     get 'registration_nickname'
  #     get 'registration_sms'
  #     get 'registration_address'
  #     get 'registration_card'
  #     get 'registration_done'
  #   end
  # end

  resources :mypages do
    collection do
      get 'credit'
      get 'exhibition'
      get 'identification'
      get 'logout'
      get 'profile'
    end
  end

  resources :cards do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :purchases do
    member do
      post 'pay', to: 'purchases#pay'
    end
  end

end
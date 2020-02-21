Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'items#index'

  resources :items do
  
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do

      get 'paycheck'
      post 'pay'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
  resources :categories, only: [:new, :show]
  resources :signups, only: [:index, :create, :destroy] do
    get 'log_in'
    collection do
      get 'user_register'
      get 'address_register'
      get 'phone_register'
      get 'done_register'
    end
  end
  resources :user, only: [:index] do
    collection do
      get 'right_buy'
      get 'right_like'
      get 'right_logout'
      get 'right_sell'
      get 'right_card'
    end
  end
  
  resources :card, only: [:new, :show, :index] do
    collection do
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
      get 'right_card'
    end
  end
  
end

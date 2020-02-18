Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: 'items#index'
  resources :items, only: [:index, :show, :new, :create] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
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
end

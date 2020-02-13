Rails.application.routes.draw do
  devise_for :users
  root to: 'items#new'
  resources :items, only: [:index, :show, :new, :create] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :signups do
    get 'log_in'
    collection do
      get 'register1'
      get 'register2'
      get 'register3'
      get 'register4'
    end
  end
end

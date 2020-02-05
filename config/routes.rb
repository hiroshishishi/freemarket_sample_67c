Rails.application.routes.draw do
  devise_for :users
  # root to: 'posts#index'
  root to: 'posts#new'
end

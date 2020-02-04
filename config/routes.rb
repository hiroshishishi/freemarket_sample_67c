Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#show'
end

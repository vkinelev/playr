Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'prime#index'
  get 'primality_check', to: 'prime#index'

  namespace :api do
    post 'prime/check', to: 'prime#check'
  end
end

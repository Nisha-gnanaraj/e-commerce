Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :stores
  devise_for :users
  root 'welcome#index'
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  resources:gallery do
    collection do
      get 'index'
      get 'search'
      post 'search'
      get 'checkout'
      get 'purchase_complete'
      post 'checkout'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

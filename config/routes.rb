Rails.application.routes.draw do
  get '/home/about' => 'homes#about'
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:create, :index, :show, :edit, :destroy, :update]

end

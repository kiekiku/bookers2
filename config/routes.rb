Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users
   resources :books
   resources :users
   

  # get 'users/show'
  # get 'users/edit'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'homes/top'
  # devise_for :users
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

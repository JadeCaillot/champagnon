Rails.application.routes.draw do

  get 'attendances/new'
  get 'attendances/create'
  root 'events#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :attendances
  end 
  resources :users, only: [:show, :edit, :update]
 
end

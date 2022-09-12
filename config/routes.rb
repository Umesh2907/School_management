Rails.application.routes.draw do
  # get 'schools/index'
  root to: 'schools#index'
  # get 'schools/new'
  # get 'schools/edit'
  # get 'lectures/index'
  # get 'lectures/show'
  # get 'lectures/new'
  # get 'lectures/edit'
  # get 'feedbacks/index'
  # get 'feedbacks/show'
  # get 'feedbacks/new'
  # get 'feedbacks/edit'
  # get 'class_rooms/index'
  # get 'class_rooms/show'
  # get 'class_rooms/new'
  # get 'class_rooms/edit'
  # get 'attendances/index'
  # get 'attendances/show'
  # get 'attendances/new'
  # get 'attendances/edit'
  # get 'users/index'
  devise_for :users, controllers: { registrations: "users/registrations" }
  # root to: 'users#index'

  resources :schools do
    resources :class_rooms
    resources :users
  end
  resources :users do
    resources :attendances
    resources :feedbacks
  end
  resources :class_rooms do
    resources :lectures
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

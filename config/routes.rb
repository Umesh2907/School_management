Rails.application.routes.draw do
  root to: 'schools#index'
  devise_for :users, controllers: { registrations: "users/registrations" }

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

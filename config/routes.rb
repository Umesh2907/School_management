Rails.application.routes.draw do
  root to: 'schools#index'
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :schools do
    resources :standards
    resources :users
    resources :teachers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

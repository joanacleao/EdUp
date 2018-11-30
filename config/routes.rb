Rails.application.routes.draw do
  # get 'courses/index'

  # get 'courses/new'

  # get 'courses/create'

  # get 'courses/edit'

  # get 'courses/update'

  # get 'courses/destroy'

  #devise_for :users

  devise_for :users, controllers: { registrations: 'users/registrations' }


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :videos, only: [:index, :new, :create, :destroy, :show]
    resources :invitations, only: [:new, :create, :destroy, :show]
  end


end

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
    resources :invitations, only: [:index, :new, :create, :destroy]
    get '/invitations/:id' , to: 'invitations#resend', as: :resend_invitation
  end

    namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :courses, only: [ :index, :show] do
        resources :videos, only: [:index, :show]
      end
    end
  end

end

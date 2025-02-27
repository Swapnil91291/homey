Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: :show do
    resources :comments, only: :create
    member do
      patch :update_status
    end
  end
end

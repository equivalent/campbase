Rails.application.routes.draw do
  resources :projects, only: [:index, :update, :show] do
    resources :comments, only: [:show, :new, :edit, :create, :destroy, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end

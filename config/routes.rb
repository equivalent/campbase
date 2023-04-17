Rails.application.routes.draw do
  resources :projects, only: [:index, :update, :show] do
    resources :comments, only: [:create, :new] do
      get :created, on: :member
    end
  end
  resources :comments, only: [:show, :edit, :destroy, :update]

  resources :sessions, only: [:index] do
    get :login,  on: :member
    get :logout, on: :collection
  end

  root "sessions#index"
end

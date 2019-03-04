Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'documents#index', as: :authenticated_root
  end

  root to: "landing#home"
  resources :documents, only: [:create, :new, :index]
end

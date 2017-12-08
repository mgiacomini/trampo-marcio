Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :profiles, only: [:edit, :update, :show]
  resources :students
  resources :subjects do
    member do
      delete :student
    end
  end
  devise_for :users
end

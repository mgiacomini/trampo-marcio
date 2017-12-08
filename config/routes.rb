Rails.application.routes.draw do
  resources :students
  resources :subjects do
    member do
      delete :student
    end
  end
  devise_for :users
end

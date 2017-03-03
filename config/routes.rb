Rails.application.routes.draw do
  root 'applicants#new'
  resources :applicants, only: [:create, :update, :show, :new]
  resources :funnels, only: [:index]
end

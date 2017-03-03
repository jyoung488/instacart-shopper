Rails.application.routes.draw do
  root 'applicants#new'
  resources :applicants, except: :index
  resources :funnels, only: [:index]
end

Rails.application.routes.draw do
  root 'applicants#new'
  resources :applicants, except: :index
  resources :funnels, only: [:index]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

end

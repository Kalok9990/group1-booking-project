Rails.application.routes.draw do
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms

  # Route Directory
  root 'rooms#week'

  get '/week', to: 'rooms#week'
  get '/day', to: 'rooms#day'
end

Rails.application.routes.draw do
  get '/calendar', to: 'calendar#index'
  get /calendar, to: calendar#index
  get /$1, to: $1#index
  get /$1, to: $1#index
  get /calendar, to: calendar#index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

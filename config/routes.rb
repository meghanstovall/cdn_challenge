Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/locations/new', to: 'user_locations#new';
  post '/locations', to: 'user_locations#create'
end

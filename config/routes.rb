Rails.application.routes.draw do
  root 'top#index'
  get '/about', to: 'top#about'
  get "lesson/:action(/:name)" => 'lesson'
end

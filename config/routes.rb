Rails.application.routes.draw do
  root 'top#index'
  get '/about', to: 'top#about'
  get "lesson/:action(/:name)" => 'lesson'

  resources :members do
    collection { get "search" }                 #メンバーの検索
  end
  # resources :members do
  #   collection { get "search" }               #メンバーの検索
  #   member { patch "suspend", "restore" }     #メンバーの停止・再開
  # end


end

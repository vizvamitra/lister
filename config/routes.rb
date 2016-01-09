Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'homepage#show'
  resources :lists, defaults: { format: :json }, constraints: {format: :json}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

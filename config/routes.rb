Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'homepage#show'

  constraints format: :json do
    resources :lists, defaults: {format: :json} do
      resources :items, controller: 'list_items', defaults: {format: :json}
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

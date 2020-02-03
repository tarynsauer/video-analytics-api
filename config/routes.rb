Rails.application.routes.draw do
  resources :playlists, only: [:index, :show]
  
  post 'authenticate', to: 'authentication#authenticate'
end

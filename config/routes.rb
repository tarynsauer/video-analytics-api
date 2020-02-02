Rails.application.routes.draw do
  resources :playlists, only: [:index, :show]
end

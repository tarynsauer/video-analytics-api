Rails.application.routes.draw do
  resources :playlists, only: [:index]
  resources :videos, only: [:index]
end

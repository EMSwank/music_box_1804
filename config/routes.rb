Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists, shallow: true do
    resources :songs, except: [:index]
  end
  resources :songs, only: [:new, :index]
  resources :playlists
end

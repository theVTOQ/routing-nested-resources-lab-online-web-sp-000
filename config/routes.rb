Rails.application.routes.draw do
  resources :artists, only: [:show] do
    resources :posts, only: [:show, :index]
  end

  resources :songs
end

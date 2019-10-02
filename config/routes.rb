Rails.application.routes.draw do
  resources :artists do
    resources :posts, only: [:show, :index]
  end

  resources :songs, only: [:show, :index]

  root 'songs#index'
end

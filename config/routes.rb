Rails.application.routes.draw do
  resources :artists do
    resources :posts, only: [:show, :index]
  end

  resources :songs

  root 'songs#index'
end

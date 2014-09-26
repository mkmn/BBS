BBS::Application.routes.draw do
  root to: 'topics#index'

  resources :topics, except: [:edit, :update, :destroy] do
    resources :articles, only: [:create]
  end
end

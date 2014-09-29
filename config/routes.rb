BBS::Application.routes.draw do
  root to: 'topics#index'

  resource :session, only: [:show, :create, :destroy]
  resources :topics, except: [:edit, :update, :destroy] do
    resources :articles, only: [:create]
  end

  namespace 'admin' do
    root to: 'topics#index'
    resources :topics, except: [:new, :create] do
      resources :articles, only: [:edit, :update, :destroy]
    end
  end

  match "*anything" => "application#rescue_404"
end

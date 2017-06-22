Rails.application.routes.draw do
  devise_for :users
  root 'pages#top'
  namespace :admin do
    get '/', to: 'home#top'
    get :settings, to: 'home#settings'
    get 'posts/new', to: 'sites#new_post'

    resources :users
    resources :sites do
      get :posts, to: 'sites#posts'
      get :users, to: 'sites#users'
    end
  end

  namespace :api do
    resources :sites, :only => [:index] do
      get 'posts/new'
    end
  end

end

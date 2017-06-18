Rails.application.routes.draw do
  devise_for :users
  root 'pages#top'
  namespace :admin do
    get '/', to: 'home#top'
    get :new_post, to: 'home#new_post'
    get :settings, to: 'home#settings'
    resources :sites
    resources :users
  end
end

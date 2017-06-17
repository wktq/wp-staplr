Rails.application.routes.draw do
  devise_for :users
  root 'pages#top'
  namespace :admin do
    get '/', to: 'home#top'
    resources :sites
  end
end

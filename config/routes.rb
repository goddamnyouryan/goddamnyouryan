Rails.application.routes.draw do
  resources :sites, only: :index
  resources :blog, as: :blog, only: [:index, :show]
  resources :messages, only: :create

  namespace :admin do
    resources :sites, except: [:index, :show] do
      collection { post :sort }
    end
    resources :blog, as: :blog, except: [:index, :show]
    root to: 'base#index'
  end

  get '/sitemap', to: 'sites#sitemap', defaults: { format: :xml }

  root to: 'sites#index'
end

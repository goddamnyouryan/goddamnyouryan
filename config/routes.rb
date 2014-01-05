Goddamnyouryan::Application.routes.draw do
  resources :sites, except: :show do
    collection { post :sort }
  end
  resources :blog, as: :blog do
    collection { get '/page/:page', to: 'blog#index' }
  end
  resources :messages, only: :create
  match '/admin', to: 'sites#admin'
  match '/sitemap', to: 'sites#sitemap', defaults: { format: :xml }

  root to: 'sites#index'
end

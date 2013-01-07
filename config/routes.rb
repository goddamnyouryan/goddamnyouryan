Goddamnyouryan::Application.routes.draw do
  resources :sites, except: :show do
    collection { post :sort }
  end
  resources :blog
  resources :messages, only: :create
  match '/admin', to: 'sites#admin'

  root :to => 'sites#index'
end

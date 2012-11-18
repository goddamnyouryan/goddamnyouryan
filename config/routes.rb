Goddamnyouryan::Application.routes.draw do
  resources :sites do
    collection { post :sort }
  end
  resources :blog
  match '/admin', to: 'sites#admin'

  root :to => 'sites#index'
end

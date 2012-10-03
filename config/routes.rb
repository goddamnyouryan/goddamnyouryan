Goddamnyouryan::Application.routes.draw do
  resources :sites
  match '/admin', to: 'sites#admin'

  root :to => 'sites#index'
end

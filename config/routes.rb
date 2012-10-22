Goddamnyouryan::Application.routes.draw do
  resources :sites
  match '/admin', to: 'sites#admin'
  match '/sort', to: 'sites#sort'

  root :to => 'sites#index'
end

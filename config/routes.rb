Goddamnyouryan::Application.routes.draw do
  resources :sites do
    collection { post :sort }
  end
  resources :blog
  match '/admin', to: 'sites#admin'
  match '/contact', to: 'sites#contact'

  root :to => 'sites#index'
end

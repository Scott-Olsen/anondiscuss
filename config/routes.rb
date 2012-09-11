Anondiscuss::Application.routes.draw do
  resources :posts

  root :to => "static-pages#home"

  match '/help',	to: 'static_pages#help'
  match '/about',	to: 'static_pages#about'

end

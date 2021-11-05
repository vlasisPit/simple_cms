Rails.application.routes.draw do

  # Root page. Triggered by http://localhost:3000/
  root 'demo#index'

  # OR you can write it as =>
  # match "demo/index", :to => "demo#index", :via => :get
  get 'demo/index'

  # default route
  # triggered by http://localhost:3000/demo/index, http://localhost:3000/demo  (default is index action)
  # get ':controller(/:action(/:id))'

  # resources :subjects # adds all resourceful routes (except delete route)
  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

=begin
  get 'pages/index'
  get 'pages/show'
  get 'pages/new'
  get 'pages/edit'
  get 'pages/delete'

  get 'subjects/index'
  get 'subjects/show'
  get 'subjects/new'
  get 'subjects/edit'
  get 'subjects/delete'
=end
end


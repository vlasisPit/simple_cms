Rails.application.routes.draw do

  # Root page. Triggered by http://localhost:3000/
  root 'demo#index'

  # OR you can write it as =>
  # match "demo/index", :to => "demo#index", :via => :get
  get 'demo/index'

  # default route
  # triggered by http://localhost:3000/demo/index, http://localhost:3000/demo  (default is index action)
  # get ':controller(/:action(/:id))'
end


ActionController::Routing::Routes.draw do |map|
  map.resources :user_roles
  map.resources :transactions

  map.resources :users, :member => {:approve => :get, :decline => :post, :activate => :post}
  map.resource :pages, :member => {:home => :get, :contact_us => :get, :about => :get, :blog => :get, :photos => :get}
  map.resource :user_session
  map.resource :reset_password
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.login '/admin', :controller => 'user_sessions', :action => 'new'
  map.root :controller => :pages, :action => :home
end

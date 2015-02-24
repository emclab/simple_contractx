Rails.application.routes.draw do

  mount SimpleContractx::Engine => "/simple_contractx"
  mount Commonx::Engine => "/commonx"
  mount Authentify::Engine => '/authentify'
  mount ExtConstructionProjectx::Engine => '/projectx'
  mount Kustomerx::Engine => '/kustomerx'
  mount Searchx::Engine => '/searchx'
  
  
  root :to => "authentify/sessions#new"
  get '/signin',  :to => 'authentify/sessions#new'
  get '/signout', :to => 'authentify/sessions#destroy'
  get '/user_menus', :to => 'user_menus#index'
  get '/view_handler', :to => 'authentify/application#view_handler'
end

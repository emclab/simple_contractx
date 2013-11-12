SimpleContractx::Engine.routes.draw do
  resources :contracts

  root :to => 'contracts#index'
end

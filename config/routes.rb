Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/companies", to: 'companies#index'
  get "/companies/new", to: 'companies#new'
  get "/companies/:id", to: 'companies#show'
  post "/companies", to: 'companies#create'
  get "companies/:id/edit", to: 'companies#edit'
  patch "/companies/:id", to: 'companies#update'
  delete "/companies/:id", to: 'companies#destroy'
end

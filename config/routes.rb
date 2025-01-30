Rails.application.routes.draw do
  get "usuarios/index"
  get "usuarios/show"
  devise_for :users, controllers: { registrations: "users/registrations" }  # Aqui você define que o controlador de registro será o seu customizado }
  root "admin#index"
  get "admin/index"
  get "home/index"

  # Rotas Scaffold
  resources :usuarios, only: [ :index, :show, :destroy ]
  resources :funcoes
  resources :estabelecimentos
  resources :users_estabelecimentos
  resources :categorias
  resources :produtos do
    collection do
      get :cards, path: "cards", as: :cards
    end
  end




  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end

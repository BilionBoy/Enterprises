Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }  # Aqui você define que o controlador de registro será o seu customizado }
  root "admin#index"
  get "admin/index"
  get "home/index"

  # Rotas Scaffold
  resources :funcoes


  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end

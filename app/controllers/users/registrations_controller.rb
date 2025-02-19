class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]
  before_action :configure_account_update_params, only: [ :update ]

  private

  # Permite adicionar novos parâmetros ao registro
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nome, :cpf, :telefone, :funcao_id ])
  end

  # Permite adicionar novos parâmetros à atualização de conta
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :nome, :cpf, :telefone, :funcao_id ])
  end
end

# frozen_string_literal: true

class Funcao < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  def self.ransackable_attributes(auth_object = nil)
    %w[nome descricao created_at updated_at]
  end
end

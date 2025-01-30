# frozen_string_literal: true

class Produto < ApplicationRecord
  # Relacionamentos
  belongs_to :categoria
  #  Validações
  has_one_attached :imagem

    # Validação opcional: Garantir que o produto tenha uma imagem.
    validates :imagem, presence: true, if: :imagem_required?

    private

    def imagem_required?
      # Defina a lógica para quando a imagem é obrigatória.
      # Exemplo: Quando o produto não tem uma descrição específica, exige-se uma imagem.
      descricao.blank?
    end
end

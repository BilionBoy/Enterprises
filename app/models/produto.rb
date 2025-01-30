# frozen_string_literal: true

class Produto < ApplicationRecord
  # Relacionamentos
  belongs_to :categoria
  #  Validações
  has_one_attached :image
end

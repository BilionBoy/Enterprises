# frozen_string_literal: true

class Categoria < ApplicationRecord
  # Relacionamentos
  belongs_to :estabelecimento
  has_many :produtos
end

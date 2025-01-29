# frozen_string_literal: true

class Estabelecimento < ApplicationRecord
  # Relacionamentos
  has_many :users_estabelecimentos
  has_many :users, through: :users_estabelecimentos
  has_many :categorias
end

class Funcao < ApplicationRecord
  # Relacionamentos
  has_many :users
  # Validações
  validates :nome, presence: true
end

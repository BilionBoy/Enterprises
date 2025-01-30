# frozen_string_literal: true

class Produto < ApplicationRecord
  # Relacionamentos
  belongs_to :categoria
# Validações
has_and_belongs_to_many
end

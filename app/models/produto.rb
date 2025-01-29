# frozen_string_literal: true

class Produto < ApplicationRecord
  # Relacionamentos
  belongs_to :categoria
end

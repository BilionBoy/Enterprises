# frozen_string_literal: true

class UserEstabelecimento < ApplicationRecord
  # Relacionamentos
  belongs_to :user
  belongs_to :estabelecimento
end

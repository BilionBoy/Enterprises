# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Relacionamentos
  belongs_to :funcao
  has_many :users_estabelecimentos, dependent: :destroy
  has_many :estabelecimentos, through: :users_estabelecimentos

  # Validações
  validates :nome,     presence: true
  validates :email,    presence: true
  validates :cpf, presence: true, format: { with: /\A\d{11}|\d{14}\z/, message: "deve ter 11 (CPF) ou 14 (CNPJ) dígitos" }
  validates :telefone, presence: true
end

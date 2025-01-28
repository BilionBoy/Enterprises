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
  validates :cpf, presence: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :telefone, presence: true
end

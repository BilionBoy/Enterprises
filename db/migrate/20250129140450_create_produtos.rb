# frozen_string_literal: true

class CreateProdutos < ActiveRecord::Migration[7.2]
  def up
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco
      t.integer :quantidade_estoque
      t.text :descricao
      t.text :ingredientes
      t.references :categoria, null: false, foreign_key: true

      # Adiciona o suporte para imagem com Active Storage
      t.references :imagem, null: true, foreign_key: { to_table: :active_storage_attachments }

      t.timestamps
    end
  end

  def down
    drop_table :produtos
  end
end

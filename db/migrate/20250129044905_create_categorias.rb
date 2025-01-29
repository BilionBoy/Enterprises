# frozen_string_literal: true

class CreateCategorias < ActiveRecord::Migration[7.2]
  def up
    create_table :categorias do |t|
      t.string :nome
      t.text :descricao
      t.references :estabelecimento, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :categorias
  end
end

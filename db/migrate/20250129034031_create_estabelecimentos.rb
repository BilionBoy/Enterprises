# frozen_string_literal: true

class CreateEstabelecimentos < ActiveRecord::Migration[7.2]
  def up
    create_table :estabelecimentos do |t|
      t.string :nome
      t.string :cnpj
      t.text :endereco
      t.string :telefone
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :estabelecimentos
  end
end

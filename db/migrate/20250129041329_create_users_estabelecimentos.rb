# frozen_string_literal: true

class CreateUsersEstabelecimentos < ActiveRecord::Migration[7.2]
  def up
    create_table :users_estabelecimentos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :estabelecimento, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :users_estabelecimentos
  end
end

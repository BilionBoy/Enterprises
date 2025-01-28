class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "created_by", "deleted_at", "descricao", "id", "nome", "updated_at", "updated_by" ]
  end
end

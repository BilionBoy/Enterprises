# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular "user", "users"
  inflect.irregular "funcao", "funcoes"
  inflect.irregular "estabelecimento", "estabelecimentos"
  inflect.irregular "user_estabelecimento", "users_estabelecimentos"
  inflect.irregular "categoria",  "categorias"
  inflect.irregular "produto", "produtos"
end

json.extract! produto, :id, :nome, :preco, :quantidade_estoque, :descricao, :ingredientes, :categoria_id, :created_at, :updated_at
json.url produto_url(produto, format: :json)

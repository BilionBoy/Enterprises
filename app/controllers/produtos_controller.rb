# frozen_string_literal: true

class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    # Filtra os produtos que pertencem às categorias associadas aos estabelecimentos do usuário logado
    @q = Produto.joins(categoria: :estabelecimento)
                .where(estabelecimentos: { id: current_user.estabelecimentos.pluck(:id) })
                .ransack(params[:q])

    @pagy, @produtos = pagy(@q.result)
  end

  def cards
    @q = Produto.ransack(params[:q])

    # Garantir que a busca seja feita com a paginação aplicada
    @pagy, @produtos = pagy(@q.result(distinct: true).includes(:categoria))

    render "produtos/index_cards"
  end



  def new
    @produto = Produto.new
  end

  def edit
  end

  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      redirect_to produtos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @produto.update(produto_params)
      redirect_to produtos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @produto.destroy
      redirect_to produtos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to produtos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_produto
    @produto = Produto.find_by(id: params[:id])
    redirect_to produtos_path, alert: t("messages.not_found") unless @produto
  end
  def produto_params
    permitted_attributes = Produto.column_names.reject { |col| [ "deleted_at", "created_by", "updated_by" ].include?(col) }
    permitted_attributes << "categoria_id" unless permitted_attributes.include?("categoria_id") # Garante que categoria_id seja permitido
    params.require(:produto).permit(permitted_attributes.map(&:to_sym) + [ :imagem ])
  end


  def handle_not_found
    redirect_to produtos_path, alert: t("messages.not_found")
  end
end

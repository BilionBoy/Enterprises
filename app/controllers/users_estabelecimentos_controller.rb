# frozen_string_literal: true

class UsersEstabelecimentosController < ApplicationController
  before_action :set_user_estabelecimento, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = UserEstabelecimento.ransack(params[:q])
    @pagy, @users_estabelecimentos = pagy(@q.result)
  end

  def new
    @user_estabelecimento = UserEstabelecimento.new
  end

  def edit
  end

  def create
    @user_estabelecimento = UserEstabelecimento.new(user_estabelecimento_params)

    if @user_estabelecimento.save
      redirect_to users_estabelecimentos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user_estabelecimento.update(user_estabelecimento_params)
      redirect_to users_estabelecimentos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user_estabelecimento.destroy
      redirect_to users_estabelecimentos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to users_estabelecimentos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_user_estabelecimento
    @user_estabelecimento = UserEstabelecimento.find_by(id: params[:id])
    redirect_to users_estabelecimentos_path, alert: t("messages.not_found") unless @user_estabelecimento
  end

  def user_estabelecimento_params
    permitted_attributes = UserEstabelecimento.column_names.reject { |col| [ "deleted_at", "created_by", "updated_by" ].include?(col) }
    params.require(:user_estabelecimento).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to users_estabelecimentos_path, alert: t("messages.not_found")
  end
end

class Admin::DashboardController < ApplicationController
  # Verificar se é admin ANTES de executar qualquer ação
  before_action :ensure_admin

  def index
    # Placeholder para dashboard admin (Etapa 1 = básico)
  end

  private

  def ensure_admin
    # Se não for admin, expulsar do sistema
    redirect_to root_path unless current_user&.admin?
  end
end

class ApplicationController < ActionController::Base
  # Forçar login em todas as páginas
  before_action :authenticate_user!

  # Redirecionamento após login baseado no tipo de usuário
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path  # Admin vai para área administrativa
    else
      user_dashboard_path   # User comum vai para área pessoal
    end
  end
end

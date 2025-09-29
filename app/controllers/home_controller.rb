class HomeController < ApplicationController
  # Permitir acesso à home sem login (única página pública)
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # Se já estiver logado, redirecionar para área correta
    redirect_to after_sign_in_path_for(current_user) if user_signed_in?
  end
end

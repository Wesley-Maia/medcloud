class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Configurações do Devise
  devise :database_authenticatable, :rememberable, :validatable

  # Definir tipos de usuário (Rails 8 syntax)
  enum :role, { user: "user", admin: "admin" }

  # Validações extras
  validates :role, presence: true, inclusion: { in: roles.keys }

  # Definir role padrão quando criar usuário
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end

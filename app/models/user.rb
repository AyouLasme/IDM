class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :reservations


  # Définir les rôles disponibles
  ROLES = %w[admin manager user].freeze

  # Vérifications de rôle
  def admin?
  role == 'admin'
  end

  def manager?
  role == 'manager'
  end

  def user?
  role == 'user'
  end
end

  

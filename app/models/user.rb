class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :reservations
  validates :email, presence: true, uniqueness: true


  # Exemple de gestion simple de rôles
  ROLES = %w[admin utilisateur gestionnaire].freeze

  def admin?
    role == 'admin'
  end

  def utilisateur?
    role == 'utilisateur'
  end

  def gestionnaire?
    role == 'gestionnaire'
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations

  # Définir les rôles disponibles
  ROLES = %w[admin manager user].freeze

  # Validations
  validates :nom, presence: true
  validates :prenom, presence: true
  validates :adresse, presence: true
  validates :role, inclusion: { in: ROLES, message: "%{value} n'est pas un rôle valide" }, presence: true

  # Définir un rôle par défaut avant validation
  before_validation :set_default_role, on: :create

  def admin?
    role == 'admin'
  end

  def manager?
    role == 'manager'
  end

  def user?
    role == 'user'
  end

  private

  def set_default_role
    self.role ||= 'user'
  end

  validates :password, presence: true, on: :create
  validates :password, confirmation: true, allow_blank: true
end

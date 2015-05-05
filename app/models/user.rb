class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true

  has_many :golf_courses

  has_many :games

  has_many :invitations
  has_many :invited_games, through: :invitations, source: :game

  has_many :requests
  has_many :requested_games, through: :requests, source: :game

  def full_name
    "#{first_name} #{last_name}".strip
  end

end

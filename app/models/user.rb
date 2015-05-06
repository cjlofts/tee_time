class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true

  has_many :golf_courses

  has_many :game_players
  has_many :games, through: :game_players

  has_many :invitations
  has_many :invited_games, through: :invitations, source: :game

  has_many :requests
  has_many :requested_games, through: :requests, source: :game
  has_many :requested_users, through: :games, source: :requests

  has_many :ownership_game_players, -> { where(owner: true) }, class_name: 'GamePlayer'
  has_many :owned_games, through: :ownership_game_players, source: :game, class_name: 'Game'

  has_many :invited_game_players, -> { where(status: 'invited') }, class_name: 'GamePlayer'
  has_many :invited_games, through: :invited_game_players, source: :game, class_name: 'Game'

  has_many :requested_game_players, -> { where(status: 'requested') }, class_name: 'GamePlayer'
  has_many :requested_games, through: :requested_game_players, source: :game, class_name: 'Game'

  def full_name
    "#{first_name} #{last_name}".strip
  end
end

class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true

  mount_uploader :user_image, UserImageUploader

  has_many :golf_courses

  has_many :game_players
  has_many :games, through: :game_players

  has_many :requesting_users, through: :games


  has_many :ownership_game_players, -> { where(owner: true) }, class_name: 'GamePlayer'
  has_many :owned_games, through: :ownership_game_players, source: :game, class_name: 'Game'

  has_many :invitations, -> { where(status: 'invited') }, class_name: 'GamePlayer'
  has_many :invited_games, through: :invitations, source: :game, class_name: 'Game'

  has_many :requests, -> { where(status: 'requested') }, class_name: 'GamePlayer'
  has_many :requested_games, through: :requests, source: :game, class_name: 'Game'

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def invited(game)
    game_players.where("game_id = :game_id AND status = :status",
    {:game_id => game.id, :status => "invited"})
  end

  def requested(game)
    game_players.where("game_id = :game_id AND status = :status",
    {:game_id => game.id, :status => "requested"})
  end

  def already_playing(game)
    game_players.where("game_id = :game_id AND status = :status",
    {:game_id => game.id, :status => "confirmed"}).any?
  end

  def already_declined(game)
    game_players.where("game_id = :game_id AND status = :status",
    {:game_id => game.id, :status => "declined"})
  end

  def pending_requests
    GamePlayer.where(game: owned_games, status: "requested")
  end

end

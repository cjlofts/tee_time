class Game < ActiveRecord::Base
  validates :golf_course_id, presence: true

  belongs_to :golf_course

  has_many :game_players, dependent: :destroy
  has_many :users, through: :game_players

  has_many :requests_from_game_players, -> { where(status: 'requested') }, class_name: 'GamePlayer'
  has_many :requesting_users, through: :requests_from_game_players, source: :user, class_name: 'User'

  def owner
    game_players.where(owner: true).first.user
  end

  def request_pending
    game_players.where(status: "invited").first.user
  end

  def game_full?
    game_players.where(status: "confirmed").count >= 4
  end

  def has_user?(user)
    game_players.where("user_id = :user_id", {:user_id => user.id}).any?
  end

  def joinable?(user)
    !has_user?(user) && !game_full?
  end

  def confirmed_to_play
    game_players.where(status: "confirmed")
  end
end

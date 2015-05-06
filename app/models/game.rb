class Game < ActiveRecord::Base
  validates :golf_course_id, presence: true

  belongs_to :golf_course

  has_many :invitations, dependent: :destroy
  has_many :requests, dependent: :destroy

  has_many :game_players, dependent: :destroy
  has_many :users, through: :game_players

  def owner
    game_players.where(owner: true).first.user
  end

end

class GamePlayer < ActiveRecord::Base
  include AASM

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :user_id, uniqueness: { scope: :game_id }


  belongs_to :user
  belongs_to :game

  aasm whiny_transitions: false, column: :status do
    state :confirmed
    state :declined
    state :requested
    state :invited

    event :decline do
      transitions from: [:invited, :requested], to: :declined
    end

    event :accept do
      transitions from: [:invited, :requested], to: :confirmed
    end
  end

  def self.for_game_and_user(game, user)
    where(game_id: game.id, user_id: user.id).first
  end

end

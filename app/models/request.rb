class Request < ActiveRecord::Base
  after_initialize :defaults
  validates :user_id, presence: true
  validates :game_id, presence: true

  belongs_to :user
  belongs_to :game

  def defaults
    self.confirmed = false if self.confirmed.nil?
  end
end

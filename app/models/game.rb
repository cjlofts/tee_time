class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :golf_course

  has_many :invitations, dependent: :destroy
  has_many :requests, dependent: :destroy
end

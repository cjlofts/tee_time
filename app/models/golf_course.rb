class GolfCourse < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true

  belongs_to :user
  has_many :games

  geocoded_by :address
  after_validation :geocode
end

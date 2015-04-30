class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :golf_course
end

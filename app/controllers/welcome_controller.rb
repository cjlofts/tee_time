class WelcomeController < ApplicationController

  layout "landing"

  def index
    @courses = GolfCourse.all
  end

end

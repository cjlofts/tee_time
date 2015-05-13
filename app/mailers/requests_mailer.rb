class RequestsMailer < ApplicationMailer

  def notify_requested_person(request)
    @recipient = request.game.owner
    @game = request.game
    @sender = request.user
    @course =  @game.golf_course.name
    mail(to: @recipient.email, subject: "Would you like to play golf?")
  end

  def decline_request(request)
    @recipient = request.user
    @game = request.game
    @sender = request.game.owner
    @course = @game.golf_course.name
    mail(to: @recipient.email, subject: "Unavailable to play golf")
  end

  def accept_request(request)
    @recipient = request.user
    @game = request.game
    @sender = request.game.owner
    @course = @game.golf_course.name
    mail(to: @recipient.email, subject: "Invitation Accepted")
  end

end

class InvitationsMailer < ApplicationMailer

  def notify_invited_person(invite)
    @recipient = invite.user
    @game = invite.game
    @sender = invite.game.owner
    @course =  @game.golf_course.name
    mail(to: @recipient.email, subject: "Would you like to play golf?")
  end

  def decline_invitation(invite)
    @recipient = invite.game.owner
    @game = invite.game
    @sender = invite.user
    @course = @game.golf_course.name
    mail(to: @recipient.email, subject: "Unavailable to play golf")
  end

end

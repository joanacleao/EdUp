class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"
    mail(to: @invitation.email, subject: 'New Invite')
  end

  def new_user_invite(invitation, path)
    @invitation = invitation
    @path = path
    mail(to: @invitation.email, subject: 'New Invite')
  end

  def existing_user_invite(invitation, path)
    @invitation = invitation
    @path = path
    mail(to: @invitation.email, subject: 'New Invite')
  end

end

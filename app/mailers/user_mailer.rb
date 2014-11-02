class UserMailer < ActionMailer::Base
  default from: 'your@email.com'

  def ticket_message_user_notification(user, admin, ticketmessage, ticket, tickettitle)
    @ticket_user = user
    @message = ticketmessage
    @admin = admin
    @ticket = ticket
    @ticket_title = tickettitle
    mail(to: user.email, subject: 'You received a ticket reply')
  end

  def ticket_message_admin_notification(user, ticket)
    @ticket = ticket
    mail(to: 'your@email.com', subject: 'A user replied to a ticket!')
  end
end

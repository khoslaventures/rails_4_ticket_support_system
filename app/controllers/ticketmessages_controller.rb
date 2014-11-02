class TicketmessagesController < ApplicationController
  def create
    if current_user || current_admin
      @ticket = Ticket.find(params[:ticket_id])
      if @ticket.status == "open"
        ticketid = @ticket
        usersticket = @ticket.user_id
        if @ticket.ticketmessages.create(ticketmessage_params)
          # When a user replies to a ticket
          if ticketmessage_params[:user_id]
            user = User.find(ticketmessage_params[:user_id])
            # Email notifications are disabled on this demo
            # UserMailer.ticket_message_admin_notification(user, ticketid).deliver

          # When an admin replies to a ticket
          elsif ticketmessage_params[:admin_id]
            admin = Admin.find(ticketmessage_params[:admin_id])
            ticketmessage = ticketmessage_params[:message]
            user = User.find(usersticket)
            # Email notifications are disabled on this demo
            # UserMailer.ticket_message_user_notification(user, admin.email, ticketmessage, ticketid, @ticket.title).deliver
          end
          redirect_to :back
        else
          flash.alert = "Error! Please try again!"
          redirect_to :back
        end
      else
        flash.alert = "The ticket is closed!"
        redirect_to tickets_path
      end
    end
  end

  private
  def ticketmessage_params
    params.require(:ticketmessage).permit(:user_id, :admin_id, :message, :ticket_id)
  end
end

class TicketsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :index]
  before_filter :authenticate_admin!, only: [:destroy]

  def index
    @tickets = current_user.tickets.order('status DESC', 'created_at DESC')
    @ticket = Ticket.new
    @ticket.ticketmessages.build
  end

  def new
    @ticket = Ticket.new
    @ticket.ticketmessages.build
  end

  def create
    @ticket = Ticket.new(ticket_params)
    url_token = SecureRandom.urlsafe_base64(32)
    t = Ticket.find_by(url_token: url_token)

    # checking if url_token does not exist is null
    while t do
      url_token = SecureRandom.urlsafe_base64(32)
      t = Ticket.find_by(url_token: url_token)
    end

    @ticket.url_token = url_token

    if @ticket.save
      flash.notice = "Ticket created successfully!"
      redirect_to ticket_path(@ticket.url_token)
    else
      flash.alert = "Error! Ticket was not created!"
      render 'index'
    end
  end

  def show
    if current_user
      token = params[:id]
      if @ticket = current_user.tickets.find_by(url_token: token)
        @messages = @ticket.ticketmessages.order('created_at DESC')
      else
        flash.alert = "No such ticket."
        redirect_to tickets_path
      end
    end

    if current_admin
      token = params[:id]
      if @ticket = Ticket.find_by(url_token: token)
        @messages = @ticket.ticketmessages.order('created_at DESC')
      else
        flash.alert = "No such ticket."
        redirect_to tickets_path
      end
    end
  end

  def close_ticket
    if current_user
      @ticket = current_user.tickets.find(params[:id])
      if @ticket.status == 'open'
        @ticket.status = 'closed'
        @ticket.save!
        redirect_to tickets_path
      end
    end

    if current_admin
      @ticket = Ticket.find(params[:id])
      if @ticket.status == 'open'
        @ticket.status = 'closed'
        @ticket.save!
        redirect_to admin_support_centre_path
      end
    end
  end

  def open_ticket
    if current_user
      @ticket = current_user.tickets.find(params[:id])
      if @ticket.status == 'closed'
        @ticket.status = 'open'
        @ticket.save!
        redirect_to tickets_path
      end
    end

    if current_admin
      @ticket = Ticket.find(params[:id])
      if @ticket.status == 'closed'
        @ticket.status = 'open'
        @ticket.save!
        redirect_to admin_support_centre_path
      end
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.destroy
      flash.notice = "Ticket deleted successfully!"
      redirect_to tickets_path
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :user_id, :status, ticketmessages_attributes: [:message, :user_id, :admin_id])
  end
end

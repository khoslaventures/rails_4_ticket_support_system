class PagesController < ApplicationController
  before_filter :authenticate_admin!, only: [:supportcentre]

  def supportcentre
    @tickets = Ticket.all.order('status DESC', 'created_at DESC')
  end
end

class Ticketmessage < ActiveRecord::Base
  belongs_to :ticket

  validates :message, presence: true,
                    length: { minimum: 1 }
end

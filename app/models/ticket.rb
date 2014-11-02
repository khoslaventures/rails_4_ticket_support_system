class Ticket < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }

  belongs_to :user
  has_many :ticketmessages, dependent: :destroy

  accepts_nested_attributes_for :ticketmessages
end

class CreateTicketmessages < ActiveRecord::Migration
  def change
    create_table :ticketmessages do |t|
      t.text :message
      t.integer :ticket_id
      t.integer :user_id
      t.integer :admin_id

      t.timestamps
    end
  end
end

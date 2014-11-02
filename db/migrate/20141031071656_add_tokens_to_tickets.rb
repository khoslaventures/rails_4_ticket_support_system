class AddTokensToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :url_token, :string

    add_index :tickets, :url_token, :unique => true
  end
end

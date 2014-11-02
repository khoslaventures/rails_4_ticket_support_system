class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end

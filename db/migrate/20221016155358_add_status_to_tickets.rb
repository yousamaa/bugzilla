class AddStatusToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :status, :string, null: false, default: 'neww'
  end
end

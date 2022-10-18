class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title, null: false, default: ''
      t.string :description
      t.datetime :deadline
      t.integer :project_id, null: false
      t.integer :creator_id, null: false
      t.integer :assigned_to_id, null: false

      t.timestamps
    end

    add_foreign_key :tickets, :projects, column: :project_id
    add_foreign_key :tickets, :users, column: :creator_id
    add_foreign_key :tickets, :users, column: :assigned_to_id
  end
end

class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title,              null: false, default: '', index: { unique: true }
      t.string :type,               null: false, default: 'bug'
      t.string :status,             null: false, default: 'new'
      t.references :project,        null: false, foreign_key: true
      t.references :creator,        foreign_key: { to_table: :users }
      t.references :assigned_to,    foreign_key: { to_table: :users }
      t.string :description
      t.datetime :deadline

      t.timestamps
    end
  end
end

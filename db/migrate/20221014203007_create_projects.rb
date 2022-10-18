class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.belongs_to :manager, null: false

      t.timestamps
    end

    add_foreign_key :projects, :users, column: :Manager_id
  end
end

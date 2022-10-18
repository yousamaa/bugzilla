class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title,        null: false
      t.string :description,  null: false
      t.references :manager,  null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

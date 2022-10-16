class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title, null: false, default: ''
      t.string :description
      t.datetime :deadline

      t.timestamps
    end
  end
end

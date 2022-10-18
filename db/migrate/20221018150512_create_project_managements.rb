class CreateProjectManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :project_managements do |t|
      t.belongs_to :Manager
      t.belongs_to :project

      t.timestamps
    end

    add_foreign_key :project_managements, :users, column: :Manager_id
    add_foreign_key :project_managements, :projects, column: :project_id
  end
end

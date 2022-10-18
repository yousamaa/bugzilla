class CreateProjectEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :project_enrollments do |t|
      t.belongs_to :developer
      t.belongs_to :project

      t.timestamps
    end

    add_foreign_key :project_enrollments, :users, column: :developer_id
    add_foreign_key :project_enrollments, :projects, column: :project_id
  end
end

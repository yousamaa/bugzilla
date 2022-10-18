class CreateProjectEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :project_enrollments do |t|
      t.references :developer, null: false, foreign_key: { to_table: :users }
      t.references :project,   null: false, foreign_key: true

      t.timestamps
    end
  end
end

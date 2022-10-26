# frozen_string_literal: true

class CreateProjectEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :project_enrollments do |t|
      t.references :developer, null: false, foreign_key: { to_table: :users }
      t.references :project,   null: false, foreign_key: true
      t.index %i[developer_id project_id],  unique: true

      t.timestamps
    end
  end
end

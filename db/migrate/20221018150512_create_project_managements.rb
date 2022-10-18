class CreateProjectManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :project_managements do |t|
      t.belongs_to :Manager
      t.belongs_to :project

      t.timestamps
    end
  end
end

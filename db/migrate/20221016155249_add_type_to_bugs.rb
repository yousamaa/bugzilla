class AddTypeToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :type, :string, null: false, default: 'bug'
  end
end

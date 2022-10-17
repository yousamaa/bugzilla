class AddTypeToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :type, :string, null: false, default: 'Bug'
  end
end

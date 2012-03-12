class AddToolboxesToolsJoinTable < ActiveRecord::Migration
  def change
    create_table :toolboxes_tools, :id => false do |t|
      t.integer :tool_id
      t.integer :toolbox_id
    end

  end

end

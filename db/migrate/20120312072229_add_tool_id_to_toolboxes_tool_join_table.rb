class AddToolIdToToolboxesToolJoinTable < ActiveRecord::Migration
  def change
    rename_column :toolboxes_tools, :tool, :tool_id 
  end
end

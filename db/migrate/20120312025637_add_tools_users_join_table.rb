class AddToolsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :tools_users, :id => false do |t|
      t.integer :user_id
      t.integer :tool_id
    end


    #add_column :users, :user_tools_id, :integer
    #add_column :tools, :user_tools_id, :integer
  end

end

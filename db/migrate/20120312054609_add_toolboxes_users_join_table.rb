class AddToolboxesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :toolboxes_users, :id => false do |t|
      t.integer :user_id
      t.integer :toolbox_id
    end

  end

end

class CreateToolboxes < ActiveRecord::Migration
  def change
    create_table :toolboxes do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end

class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :description
      t.string :category
      t.boolean :public
      t.string :url
      t.string :cost

      t.timestamps
    end
  end
end

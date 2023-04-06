class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name

      t.timestamps
    end

    add_column :todo_items, :project_id, :integer, null: true
  end
end

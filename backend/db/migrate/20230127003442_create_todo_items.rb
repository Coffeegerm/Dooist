class CreateTodoItems < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.string :description
      t.datetime :completed_date

      t.timestamps
    end
  end
end

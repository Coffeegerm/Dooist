class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    add_column :todo_items, :user_id, :integer, null: true
    add_column :projects, :user_id, :integer, null: true
  end
end

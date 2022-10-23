class CreateTodoLists < ActiveRecord::Migration
  def up
    create_table :todo_lists do |t|
      t.string :name
      t.datetime :creation_date
      t.datetime :due_date
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :todo_lists
  end
end

class CreateTodoList < ActiveRecord::Migration
  def up
    create_table :todoList do |t|
      t.string :name
      t.datetime :creation_date
      t.datetime :due_date
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :todoList
  end
end

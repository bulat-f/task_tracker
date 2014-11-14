class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :title
      t.text    :description

      t.integer :creater_id
      t.integer :performer_id

      t.integer :project_id

      t.integer :state

      t.timestamps
    end

    add_index :tasks, :performer_id
    add_index :tasks, :creater_id
    add_index :tasks, :project_id
  end
end

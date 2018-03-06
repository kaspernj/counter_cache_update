class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :tasks_count, default: 0, null: false
      t.timestamps
    end
  end
end

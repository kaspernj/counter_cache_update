# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :project, foreign_key: true, null: false
      t.timestamps
    end
  end
end

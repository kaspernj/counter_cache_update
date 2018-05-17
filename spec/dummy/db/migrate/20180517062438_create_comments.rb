class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :resource, index: true, polymorphic: true, null: false
      t.text :content, null: false
      t.timestamps
    end

    add_column :projects, :comments_count, :integer, default: 0, null: false
    add_column :tasks, :comments_count, :integer, default: 0, null: false
  end
end

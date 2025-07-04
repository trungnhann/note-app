class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :completed, default: false
      t.date :due_date
      t.integer :priority, default: 0
      t.references :project, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

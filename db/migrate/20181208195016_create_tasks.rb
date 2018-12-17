class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.date :start_at, null: false
      t.date :end_at, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end

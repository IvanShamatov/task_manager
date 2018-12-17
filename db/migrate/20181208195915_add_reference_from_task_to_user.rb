class AddReferenceFromTaskToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, index: true, null: false
  end
end

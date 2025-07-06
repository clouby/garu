class AddStatusToTasks < ActiveRecord::Migration[7.2]
  def change
    create_enum :task_status, [ "todo", "progress", "completed" ]

    add_column :tasks, :status, :enum, enum_type: :task_status, default: "todo", null: false
  end
end

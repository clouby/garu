class AddRawgGameIdToTasks < ActiveRecord::Migration[7.2]
  def change
     add_column :tasks, :rawg_game_id, :integer, null: true

     add_index :tasks, :rawg_game_id
  end
end

class CreateCategoriesVideoGamesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_video_games, id: false do |t|
      t.uuid :video_game_id
      t.uuid :category_id
    end

    add_index :categories_video_games, :video_game_id
    add_index :categories_video_games, :category_id
  end
end

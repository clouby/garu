class CreateVideoGames < ActiveRecord::Migration[7.1]
  def change
    create_table :video_games, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

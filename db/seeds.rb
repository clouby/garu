# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

categories = [{ "name": 'RPG' }]

video_games = [
  { "name": 'Elden Ring', "description": 'Álzate, Sinluz...' },
  { "name": 'Kingdom Hearts 2', "description": 'El juego comienza con Roxas, un chico de quince años...' },
  { "name": 'Diablo IV',
    "description": 'Es un videojuego de rol de acción, desarrollado y publicado por Blizzard Entertainment...' }
]

categories.each do |category|
  Category.find_or_create_by!(**category)
end

video_games.each do |video_game|
  category = Category.first
  video_game_instance = VideoGame.find_or_create_by!(**video_game)
  video_game_instance.categories << category

  video_game_instance.image.attach(io: File.open('db/images/diablo-iv.jpeg'), filename: 'default.jpeg')
end

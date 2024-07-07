require 'test_helper'

class VideoGameTest < ActiveSupport::TestCase
  def setup
    @video_game = video_games(:first)
  end

  test 'should not save the video game without name and description' do
    @video_game.name = nil
    @video_game.description = nil
    assert_not @video_game.save
  end

  test 'should be a valid video game' do
    assert @video_game.valid?
  end

  test 'should be invalid without description' do
    @video_game.description = nil
    refute @video_game.valid?, 'video game is invalid without a description'
    assert_not_nil @video_game.errors[:description], 'no validation error for description present'
  end

  test 'should be invalid without name' do
    @video_game.name = nil
    refute @video_game.valid?, 'video game is invalid without a name'
    assert_not_nil @video_game.errors[:name], 'no validation error for name present'
  end

  test 'should valid recent contents 1 week ago' do
    assert_includes VideoGame.recent, video_games(:first)
    refute_includes VideoGame.recent, video_games(:old_first)
  end
end

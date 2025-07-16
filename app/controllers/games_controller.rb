class GamesController < ApplicationController
  include TasksHelper

  def index
    @games = rawg_games_recent_releases.body
  end

  def show
    @game = rawg_games_by_id(params[:id]).body
  end
end

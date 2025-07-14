class GamesController < ApplicationController
  include TasksHelper

  def show
    @game = rawg_games_by_id(params[:id]).body
  end
end

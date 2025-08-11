class GamesController < ApplicationController
  include TasksHelper

  def search
    query = params[:query]
    if query.present?
      @games = rawg_games_search(query).body["results"]
    else
      @games = []
    end
    respond_to do |format|
      format.html { render partial: "games/search_results", locals: { games: @games } }
      format.turbo_stream { render turbo_stream: turbo_stream.replace("search_results", partial: "games/search_results", locals: { games: @games }) }
    end
  end

  def index
    @games = rawg_games_recent_releases.body
  end

  def show
    @game = rawg_games_by_id(params[:id]).body
  end
end

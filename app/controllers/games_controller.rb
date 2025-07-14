class GamesController < ApplicationController
  include TasksHelper

  def show
    @game = rawg_connection.get("games/#{params[:id]}").body
  end
end

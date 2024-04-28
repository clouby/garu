# frozen_string_literal: true

# class GamesController
class GamesController < ApplicationController
  include ApiIgdb
  def index
    @games = igdb_search
    @query = params[:q]
  end
end

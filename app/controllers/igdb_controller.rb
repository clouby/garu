# frozen_string_literal: true

# class IgdbController
class IgdbController < ApplicationController
  include ApiIgdb

  def query
    render json: igdb_query
  end

  def search
    render json: igdb_search
  end
end

# frozen_string_literal: true

# class StaticController
class StaticController < ApplicationController
  def index
    @games = VideoGame.all
  end
end

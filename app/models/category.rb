# frozen_string_literal: true

# class Category
class Category < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :video_games
end

# frozen_string_literal: true

# class VideoGame
class VideoGame < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :categories

  has_one_attached :image do |attachable|
    attachable.variant :thumbnail, resize_to_limit: [300, 300]
  end
end

class Task < ApplicationRecord
  has_rich_text :content
  belongs_to :user

  validates_presence_of :name, :description, :content

  enum :status, {
    todo: "todo", progress: "progress", completed: "completed"
  }, prefix: true

  scope :sort_by_name, -> { order(:name) }
  scope :recent_created, -> { order(created_at: :desc) }
end

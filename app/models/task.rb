class Task < ApplicationRecord
  has_rich_text :content
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :content, presence: true

  enum :status, {
    todo: "todo", progress: "progress", completed: "completed"
  }, prefix: true

  protected

  def self.sort_by_name
    order(:name)
  end
end

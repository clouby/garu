class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  enum :status, {
    todo: "todo", process: "process", completed: "completed"
  }, prefix: true

  belongs_to :user
end

module TasksHelper
  def task_status_badge_class(status)
    case status
    when "todo"
      "badge-soft badge-accent"
    when "progress"
      "badge-info"
    when "completed"
      "badge-success"
    else
      "badge-ghost"
    end
  end
end

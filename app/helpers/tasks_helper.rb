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

  def rawg_connection
    Faraday.new(
      url: Rails.application.credentials.dig(:rawg, :base_api_url),
      params: { key: Rails.application.credentials.dig(:rawg, :api_key), page_size: 20 }
    ) do |f|
        f.request :json
        f.response :json
      end
  end

  def rawg_search_games
    rawg_connection.get("games")
  end
end

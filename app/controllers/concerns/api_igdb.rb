module ApiIgdb
  extend ActiveSupport::Concern
  include ClientIgdbHelper

  included do
    rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing

    def igdb_query
      response = request_games(field_params)
      response.body
    end

    def igdb_search
      response = request_games(search_params)
      response.body
    end

    private

    # Params Sections
    def field_params
      fields = params.fetch(:fields, '*')
      fields = '*' if fields.nil?
      "fields #{fields};"
    end

    def search_params
      value = params.require(:q)
      "search \"#{value}\"; fields name;"
    end

    # Request Sections
    def request_games(value)
      conn.post('games') do |req|
        req.body = value
      end
    end

    # Handler Errors Sections
    def handle_parameter_missing
      redirect_to root_path
    end
  end
end

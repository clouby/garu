# frozen_string_literal: true

# module ApiIgdb
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

    # Params Support Request
    def field_params
      fields = params.fetch(:fields, '*')
      fields = '*' if fields.nil?
      "fields #{fields};"
    end

    def search_params
      value = params.require(:q)
      "search \"#{value}\"; fields name,summary,screenshots.*,cover.*;"
    end

    # Request Support
    def request_games(value)
      conn.post('games') do |req|
        req.body = value
      end
    rescue Faraday::UnauthorizedError => e
      puts e.response[:status]
      puts e.response[:headers]
      {}
    end

    # Handler Errors Sections
    def handle_parameter_missing(exception)
      render json: { error: exception.message }, status: :bad_request
    end
  end
end

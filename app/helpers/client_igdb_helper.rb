# frozen_string_literal: true

# module ClientIgdbHelper
module ClientIgdbHelper
  # class IgdbToken
  class IgdbToken
    # TODO: Find a solution to store and handle expiration/refresh token for IGDB
    def self.access_token
      Rails.application.credentials.dig(:igdb, :access_token)
    end

    def self.client_id
      Rails.application.credentials.dig(:igdb, :client_id)
    end
  end

  def conn
    options = {
      url: Rails.application.credentials.dig(:igdb, :base_url),
      headers: { 'Client-ID': IgdbToken.client_id }
    }

    Faraday.new(options) do |builder|
      # Include our authorization token for get access to IGDB
      builder.request :authorization, 'Bearer', -> { IgdbToken.access_token }

      # Supports builder for only support application/json format
      builder.request :json
      builder.response :json
    end
  end
end

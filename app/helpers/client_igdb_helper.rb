# frozen_string_literal: true

# module ClientIgdbHelper
module ClientIgdbHelper
  # class IgdbEnvs
  class IgdbEnvs
    # TODO: Find a solution to store and handle expiration/refresh token for IGDB
    def self.access_token
      Rails.application.credentials.dig(:igdb, :access_token)
    end

    def self.client_id
      Rails.application.credentials.dig(:igdb, :client_id)
    end

    def self.base_url
      Rails.application.credentials.dig(:igdb, :base_url)
    end
  end

  def stubs
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post("#{IgdbEnvs.base_url}/games", ->(request_body) { request_body }) do |_env|
        [200, {}, []]
      end
    end
  end

  def build_stubs(builder)
    return unless ENV['RAILS_ENV'] == 'test'

    builder.adapter :test, stubs
  end

  def conn
    options = {
      url: IgdbEnvs.base_url,
      headers: { 'Client-ID': IgdbEnvs.client_id }
    }

    Faraday.new(options) do |builder|
      # Include our authorization token for get access to IGDB
      builder.request :authorization, 'Bearer', -> { IgdbEnvs.access_token }

      # Supports builder for only support application/json format
      builder.request :json
      builder.response :json

      # Create some stubs for testing environments
      build_stubs(builder)
    end
  end
end

# frozen_string_literal: true

# class IgdbController
class IgdbController < ApplicationController
  include ClientIgdbHelper

  def query
    response = conn.post('games') do |req|
      req.body = field_params
    end
    render json: response.body
  end

  private

  def field_params
    fields = params.fetch(:fields, '*')
    fields = '*' if fields.nil?
    "fields #{fields};"
  end
end

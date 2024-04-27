class IgdbController < ApplicationController
  include ClientIgdbHelper

  def query
    response = conn.post('games') do |req|
      req.body = 'fields name,cover.*;'
    end
    render json: response.body
  end
end

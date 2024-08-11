require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test 'should not get index with q no present' do
    get games_url

    assert_response :bad_request
  end

  test 'should get index with query' do
    get games_url, params: { q: 'foo' }

    assert_response :success
  end

  test 'should not get a index with q empty' do
    get games_url, params: { q: '' }

    assert_response :bad_request
  end
end

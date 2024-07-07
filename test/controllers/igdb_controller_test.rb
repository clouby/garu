require "test_helper"

class IgdbControllerTest < ActionDispatch::IntegrationTest
  test 'should get query route successfully' do
    get igdb_query_url
    assert_response :success
    assert_equal 'application/json', @response.media_type
  end

  test 'should get search route successfully' do
    get igdb_search_url, params: { q: '_name' }
    assert_response :success
    assert_equal 'application/json', @response.media_type
  end

  test 'should throw search route with bad request' do
    get igdb_search_url

    assert_response :bad_request
    assert_equal 'application/json', @response.media_type
  end

  test 'should throw search route with blank content with bad request' do
    get igdb_search_url, params: { q: '' }

    assert_response :bad_request
    assert_equal 'application/json', @response.media_type
  end
end

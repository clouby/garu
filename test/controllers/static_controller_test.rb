require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test 'should get query route successfully' do
    get root_url

    assert_response :success
  end
end

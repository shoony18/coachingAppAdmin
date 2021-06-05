require "test_helper"

class AppAnalyticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get app_analytics_index_url
    assert_response :success
  end
end

require "test_helper"

class YoyakusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yoyakus_index_url
    assert_response :success
  end
end

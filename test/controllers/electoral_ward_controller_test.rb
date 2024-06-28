require "test_helper"

class ElectoralWardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get electoral_ward_index_url
    assert_response :success
  end
end

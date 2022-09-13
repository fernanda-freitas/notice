require "test_helper"

class MultistepControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get multistep_show_url
    assert_response :success
  end

  test "should get update" do
    get multistep_update_url
    assert_response :success
  end
end

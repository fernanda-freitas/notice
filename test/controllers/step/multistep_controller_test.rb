require "test_helper"

class Step::MultistepControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get step_multistep_show_url
    assert_response :success
  end

  test "should get update" do
    get step_multistep_update_url
    assert_response :success
  end
end

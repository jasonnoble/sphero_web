require 'test_helper'

class SpheroControlControllerTest < ActionController::TestCase
  test "should get enter_command" do
    get :enter_command
    assert_response :success
  end

  test "should get set_color" do
    get :set_color
    assert_response :success
  end

end

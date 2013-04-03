require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get easy" do
    get :easy
    assert_response :success
  end

  test "should get hard" do
    get :hard
    assert_response :success
  end

  test "should get times" do
    get :times
    assert_response :success
  end

end

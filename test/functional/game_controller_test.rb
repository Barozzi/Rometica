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

  test 'should have at least one solution' do 
    get :hard
    solution = false
    permutation_array = @game_array.permutation
    permutation_array.each do |array|
     solution = true if @key == (array[0] + array[1])
    end
    solution.should eq(true)
  end

end

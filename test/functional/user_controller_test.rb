require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get disable" do
    get :disable
    assert_response :success
  end

  test "should get favorites" do
    get :favorites
    assert_response :success
  end

  test "should get tolearn" do
    get :tolearn
    assert_response :success
  end

end

require 'test_helper'

class ToolboxesControllerTest < ActionController::TestCase
  setup do
    @toolbox = toolboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:toolboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create toolbox" do
    assert_difference('Toolbox.count') do
      post :create, toolbox: @toolbox.attributes
    end

    assert_redirected_to toolbox_path(assigns(:toolbox))
  end

  test "should show toolbox" do
    get :show, id: @toolbox.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @toolbox.to_param
    assert_response :success
  end

  test "should update toolbox" do
    put :update, id: @toolbox.to_param, toolbox: @toolbox.attributes
    assert_redirected_to toolbox_path(assigns(:toolbox))
  end

  test "should destroy toolbox" do
    assert_difference('Toolbox.count', -1) do
      delete :destroy, id: @toolbox.to_param
    end

    assert_redirected_to toolboxes_path
  end
end

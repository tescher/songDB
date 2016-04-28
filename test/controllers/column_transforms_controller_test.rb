require 'test_helper'

class ColumnTransformsControllerTest < ActionController::TestCase
  setup do
    @column_transform = column_transforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:column_transforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create column_transform" do
    assert_difference('ColumnTransform.count') do
      post :create, column_transform: {  }
    end

    assert_redirected_to column_transform_path(assigns(:column_transform))
  end

  test "should show column_transform" do
    get :show, id: @column_transform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @column_transform
    assert_response :success
  end

  test "should update column_transform" do
    patch :update, id: @column_transform, column_transform: {  }
    assert_redirected_to column_transform_path(assigns(:column_transform))
  end

  test "should destroy column_transform" do
    assert_difference('ColumnTransform.count', -1) do
      delete :destroy, id: @column_transform
    end

    assert_redirected_to column_transforms_path
  end
end

require 'test_helper'

class FoodGroupsControllerTest < ActionController::TestCase
  setup do
    @food_group = food_groups(:protein)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_group" do
    assert_difference('FoodGroup.count') do
      post :create, food_group: { calories: @food_group.calories, description: @food_group.description, name: @food_group.name }
    end

    assert_redirected_to food_group_path(assigns(:food_group))
  end

  test "should show food_group" do
    get :show, id: @food_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_group
    assert_response :success
  end

  test "should update food_group" do
    patch :update, id: @food_group, food_group: { calories: @food_group.calories, description: @food_group.description, name: @food_group.name }
    assert_redirected_to food_group_path(assigns(:food_group))
  end

  test "should destroy food_group" do
    assert_difference('FoodGroup.count', -1) do
      delete :destroy, id: food_groups(:unassigned)
    end

    assert_redirected_to food_groups_path
  end
end

require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { description: @recipe.description, name: @recipe.name, quantity: @recipe.quantity, unit: @recipe.unit, web_page: @recipe.web_page }
    end

    assert_redirected_to recipes_path()
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    patch :update, id: @recipe, recipe: { description: @recipe.description, name: @recipe.name, quantity: @recipe.quantity, unit: @recipe.unit, web_page: @recipe.web_page }
    assert_redirected_to recipes_path()
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end
end

require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:one)
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      session[:return_to] = recipes_url
      post :create, entry: { date: @entry.date, description: @entry.description, food_group_id: @entry.food_group_id, portion: @entry.portion, username: @entry.username }
    end

    assert_redirected_to recipes_url
  end

  test "should show entry" do
    get :show, id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry
    assert_response :success
  end

  test "should update entry" do
    session[:return_to] = entry_path(@entry.id)
    patch :update, id: @entry, entry: { date: @entry.date, description: @entry.description, food_group_id: @entry.food_group_id, portion: @entry.portion, username: @entry.username }
    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, id: @entry
    end

    assert_redirected_to entries_path
  end
end

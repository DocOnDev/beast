require 'test_helper'

class JournalsControllerTest < ActionController::TestCase
  setup do
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "full_name" do
    user = users(:michael)
    assert user.full_name == "Michael Norton"
  end

  test "recently_active" do
    michael = users(:michael)
    assert michael.recently_active?

    doc = users(:doc)
    assert !doc.recently_active?
  end

  test "thirty_day_activity" do
    jennifer = users(:jennifer)
    assert !jennifer.thirty_day_activity?

    doc = users(:doc)
    assert doc.thirty_day_activity?
  end

  test "active_diet" do
    michael = users(:michael)
    assert michael.active_diet.description == "DietOne"
  end

  test "active_food_groups" do
    michael = users(:michael)
    assert michael.active_food_groups[0].name == "ProteinTest"
  end

  test "daily_progress" do
    michael = users(:michael)
    progress = michael.daily_progress
    assert progress["ProteinTest"][:target] == 1.00
  end

end

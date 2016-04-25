require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "search" do
    found_items = Recipe.search("beef")
    assert found_items[0].name == "Soup"

    found_items = Recipe.search("Meatloaf")
    assert found_items[0].name == "Meatloaf"
  end
end

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "search" do
    found_items = Recipe.search("beef")
    assert found_items[0].name == "Soup"

    found_items = Recipe.search("Meatloaf")
    assert found_items[0].name == "Meatloaf"
  end

  test "should allow update of recipe with valid URL" do
    soup = recipes(:soup)
    soup.web_page = 'http://www.wearecto2.com/blog'
    assert soup.save
  end


  test "should not allow update of recipe with invalid URL" do
    soup = recipes(:soup)
    soup.web_page = 'stuff and things'
    assert_not soup.save
  end

end

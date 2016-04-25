require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "today" do
    entries = Entry.today
    assert entries[0].portion == 9.99
  end

  test "by_day" do
    target_date = Date.new(2016,03,27)
    entries = Entry.by_day(target_date)
    assert entries[0].portion == 29.99
  end
end

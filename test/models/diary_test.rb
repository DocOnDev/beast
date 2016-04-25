require 'test_helper'

class DiaryTest < ActiveSupport::TestCase
  test "today" do
    diaries = Diary.today
    assert diaries[0].sleep_score == 86
  end

  test "by_day" do
    target_date = Date.new(2016,03,21)
    diaries = Diary.by_day(target_date)
    assert diaries[0].sleep_score == 91
  end
end

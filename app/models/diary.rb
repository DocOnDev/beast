class Diary < ActiveRecord::Base
  belongs_to :user

  def self.by_day(date)
    where(:date => (date.beginning_of_day.to_date))
  end

  def self.today
    by_day(Time.zone.now.to_date)
  end
end

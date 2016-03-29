class Entry < ActiveRecord::Base
  belongs_to :food_group
  belongs_to :user

  def self.by_day(date)
    where(:created_at => (date.beginning_of_day..date.end_of_day))
  end

  def self.today
    by_day(Time.zone.now)
  end
end

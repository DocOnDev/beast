class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :entries
  has_many :diets

  def recently_active?
   updated_at > 5.minutes.ago
  end

  def thirty_day_activity?
   updated_at > 5.days.ago
  end

  def daily_log
    logs = {}
    food_groups = FoodGroup.all
    food_groups.each { |fg| logs[fg.name] = 0.0 }

    entries.where(date: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)).find_each do |entry|
      logs[entry.food_group.name] += entry.portion
    end
    return logs
  end

end

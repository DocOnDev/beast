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

  def active_diet
    now = Time.zone.now
    diets.where('"start" < ? AND "end" > ?', now, now).take
  end

  def active_food_groups
    active_diet.food_groups
  end

  def daily_progress
    # Get the allotted daily amounts for each food
    # Get the logged amount
    # progress_data = {"food_group_name" : {"target" : intake.quantity, "consumed" : daily_log[x]}}
    progress = {}
    active_diet.intakes.each do |intake|
      log = daily_log
      name = intake.food_group.name
      progress[name] = {:target => intake.quantity + 0.0, :consumed => log[name], :percent => ((log[name] / intake.quantity) * 100).round(2) }
    end
    progress
  end

  def daily_log
    logs = {}
    active_food_groups.each { |fg| logs[fg.name] = 0.0 }

    entries.today.each do |entry|
      logs[entry.food_group.name] += entry.portion
    end
    logs
  end

end

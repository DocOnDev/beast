class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :entries

  def recently_active?
   updated_at > 5.minutes.ago
  end

  def thirty_day_activity?
   updated_at > 5.days.ago
  end
end

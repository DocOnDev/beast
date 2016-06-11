class Diet < ActiveRecord::Base
  belongs_to :user
  has_many :intakes
  has_many :food_groups, :through => :intakes

  accepts_nested_attributes_for :intakes

  validates :start_date, :end_date, :overlap => {:scope => "user_id"}

  before_save :mark_intake_for_removal

  def mark_intake_for_removal
    intakes.each do |intake|
      intake.mark_for_destruction if intake.quantity.blank?
    end
  end

end
